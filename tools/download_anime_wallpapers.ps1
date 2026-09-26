# Download real SFW anime wallpapers (portrait) into catalog asset paths.
$ErrorActionPreference = 'Continue'
$root = 'C:\Users\marin\anime\assets\images'
$ua = 'AnimeWallpaperApp/1.0 (local offline catalog build)'
$used = New-Object 'System.Collections.Generic.HashSet[string]'
$delayMs = 900

Add-Type -AssemblyName System.Drawing

function Ensure-Dir([string]$p) {
  if (-not (Test-Path $p)) { New-Item -ItemType Directory -Force -Path $p | Out-Null }
}

function Save-PortraitJpeg([string]$srcPath, [string]$destPath, [int]$maxW = 1440, [int]$maxH = 2560) {
  Ensure-Dir (Split-Path $destPath)
  $img = [System.Drawing.Image]::FromFile($srcPath)
  try {
    $scale = [Math]::Min($maxW / [double]$img.Width, $maxH / [double]$img.Height)
    if ($scale -gt 1) { $scale = 1 }
    $nw = [Math]::Max(1, [int]($img.Width * $scale))
    $nh = [Math]::Max(1, [int]($img.Height * $scale))
    $bmp = New-Object System.Drawing.Bitmap $nw, $nh
    $g = [System.Drawing.Graphics]::FromImage($bmp)
    $g.InterpolationMode = [System.Drawing.Drawing2D.InterpolationMode]::HighQualityBicubic
    $g.DrawImage($img, 0, 0, $nw, $nh)
    $g.Dispose()
    $codec = [System.Drawing.Imaging.ImageCodecInfo]::GetImageEncoders() | Where-Object { $_.MimeType -eq 'image/jpeg' } | Select-Object -First 1
    $ep = New-Object System.Drawing.Imaging.EncoderParameters(1)
    $ep.Param[0] = New-Object System.Drawing.Imaging.EncoderParameter([System.Drawing.Imaging.Encoder]::Quality, 90L)
    $bmp.Save($destPath, $codec, $ep)
    $ep.Dispose(); $bmp.Dispose()
  } finally {
    $img.Dispose()
  }
}

function Search-Wallhaven([string]$query, [int]$page = 1) {
  $q = [uri]::EscapeDataString($query)
  $url = "https://wallhaven.cc/api/v1/search?q=$q&categories=010&purity=100&atleast=1080x1920&ratios=portrait&sorting=favorites&order=desc&page=$page"
  try {
    return Invoke-RestMethod -Uri $url -Headers @{ 'User-Agent' = $ua } -TimeoutSec 25
  } catch {
    Start-Sleep -Milliseconds 1500
    try { return Invoke-RestMethod -Uri $url -Headers @{ 'User-Agent' = $ua } -TimeoutSec 25 } catch { return $null }
  }
}

function Pick-Url([string]$query) {
  $queries = @($query, 'anime wallpaper', 'anime girl')
  foreach ($qq in $queries) {
    $res = Search-Wallhaven $qq 1
    Start-Sleep -Milliseconds $delayMs
    if (-not $res -or -not $res.data) { continue }
    foreach ($item in $res.data) {
      $id = [string]$item.id
      if ($used.Contains($id)) { continue }
      if ([int]$item.dimension_y -lt [int]$item.dimension_x) { continue }
      [void]$used.Add($id)
      return [string]$item.path
    }
  }
  return $null
}

function Download-To([string]$destRel, [string]$query) {
  $dest = Join-Path $root $destRel
  Write-Host "[..] $destRel ($query)"
  $url = Pick-Url $query
  if (-not $url) {
    Write-Host "[SKIP] $destRel"
    return $false
  }
  $ext = [IO.Path]::GetExtension(($url -split '\?')[0])
  if (-not $ext) { $ext = '.jpg' }
  $tmp = Join-Path $env:TEMP ("aw_" + [guid]::NewGuid().ToString('N') + $ext)
  try {
    Invoke-WebRequest -Uri $url -OutFile $tmp -Headers @{ 'User-Agent' = $ua } -TimeoutSec 60 -UseBasicParsing
    if ($dest.ToLower().EndsWith('.png')) {
      Ensure-Dir (Split-Path $dest)
      $img = [System.Drawing.Image]::FromFile($tmp)
      # fit into portrait canvas
      $scale = [Math]::Min(1080 / [double]$img.Width, 1920 / [double]$img.Height)
      if ($scale -gt 1) { $scale = 1 }
      $nw = [Math]::Max(1, [int]($img.Width * $scale))
      $nh = [Math]::Max(1, [int]($img.Height * $scale))
      $bmp = New-Object System.Drawing.Bitmap $nw, $nh
      $g = [System.Drawing.Graphics]::FromImage($bmp)
      $g.DrawImage($img, 0, 0, $nw, $nh)
      $g.Dispose(); $img.Dispose()
      $bmp.Save($dest, [System.Drawing.Imaging.ImageFormat]::Png)
      $bmp.Dispose()
    } else {
      Save-PortraitJpeg $tmp $dest
    }
    $kb = [math]::Round((Get-Item $dest).Length / 1KB)
    Write-Host "[OK] $destRel (${kb}KB)"
    return $true
  } catch {
    Write-Host "[FAIL] $destRel : $_"
    return $false
  } finally {
    Remove-Item $tmp -Force -ErrorAction SilentlyContinue
  }
}

$jobs = New-Object System.Collections.Generic.List[object]

function Add-Job([string]$rel, [string]$query) {
  $jobs.Add([pscustomobject]@{ Rel = $rel; Query = $query }) | Out-Null
}

$chars = @{
  'tanjiro'='tanjiro'; 'nezuko'='nezuko'; 'gojo'='gojo'; 'itachi'='itachi'
  'luffy'='luffy'; 'zoro'='zoro'; 'eren'='eren yeager'; 'mikasa'='mikasa'
  'levi'='levi ackerman'; 'sukuna'='sukuna'; 'goku'='goku'; 'vegeta'='vegeta'
  'naruto'='naruto'; 'sasuke'='sasuke'; 'anya'='anya forger'; 'yor'='yor forger'
  'denji'='denji'; 'power'='power chainsaw'; 'deku'='deku'; 'bakugo'='bakugo'
  'frieren'='frieren'; 'makima'='makima'; 'sung_jinwoo'='solo leveling'; 'ichigo'='ichigo'
}
foreach ($c in $chars.Keys) {
  foreach ($l in @('001','002','003','004','005')) {
    Add-Job "wallpapers\characters\char_${c}_${l}.jpg" $chars[$c]
  }
}

$series = @{
  'demon_slayer'='demon slayer'; 'jujutsu'='jujutsu kaisen'; 'one_piece'='one piece'
  'aot'='attack on titan'; 'naruto'='naruto'; 'db'='dragon ball'; 'chainsaw'='chainsaw man'
  'spy'='spy x family'; 'mha'='my hero academia'; 'solo'='solo leveling'; 'frieren'='frieren'
  'bleach'='bleach'; 'hxh'='hunter x hunter'; 'tokyo_ghoul'='tokyo ghoul'; 'vinland'='vinland saga'
}
foreach ($s in $series.Keys) { Add-Job "wallpapers\series\series_${s}_001.jpg" $series[$s] }

1..10 | ForEach-Object {
  $n = '{0:D3}' -f $_
  Add-Job "wallpapers\scenery\scenery_$n.jpg" 'anime scenery'
  Add-Job "wallpapers\live\live_$n.jpg" 'anime city night'
}
1..8 | ForEach-Object {
  $n = '{0:D3}' -f $_
  Add-Job "wallpapers\aesthetic\aesthetic_$n.jpg" 'anime aesthetic'
  Add-Job "wallpapers\action\action_$n.jpg" 'anime battle'
}
1..6 | ForEach-Object {
  $n = '{0:D3}' -f $_
  Add-Job "wallpapers\dark\dark_$n.jpg" 'dark anime'
  Add-Job "wallpapers\cute\cute_$n.jpg" 'cute anime'
  Add-Job "wallpapers\minimal\minimal_$n.jpg" 'minimal anime'
  Add-Job "wallpapers\quotes\quote_$n.jpg" 'anime wallpaper'
}

Add-Job 'categories\characters.jpg' 'anime character'
Add-Job 'categories\series.jpg' 'anime series'
Add-Job 'categories\scenery.jpg' 'anime landscape'
Add-Job 'categories\aesthetic.jpg' 'anime aesthetic'
Add-Job 'categories\dark.jpg' 'dark anime'
Add-Job 'categories\cute.jpg' 'cute anime'
Add-Job 'categories\action.jpg' 'anime action'
Add-Job 'categories\live.jpg' 'anime neon'
Add-Job 'categories\minimal.jpg' 'minimal anime'
Add-Job 'categories\quotes.jpg' 'anime art'

Add-Job 'branding\onboarding_1.png' 'anime 4k wallpaper'
Add-Job 'branding\onboarding_2.png' 'cute anime girl'
Add-Job 'branding\onboarding_3.png' 'anime scenery night'
Add-Job 'branding\app_icon.png' 'anime portrait'

Write-Host "TOTAL JOBS=$($jobs.Count)"
$ok = 0
for ($i = 0; $i -lt $jobs.Count; $i++) {
  $job = $jobs[$i]
  if (Download-To $job.Rel $job.Query) { $ok++ }
  if ((($i + 1) % 10) -eq 0) {
    Write-Host "=== progress $($i+1)/$($jobs.Count) ok=$ok ==="
  }
}
Write-Host "DONE ok=$ok / $($jobs.Count)"
