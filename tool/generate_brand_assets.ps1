# Renders Parichit's brand PNGs from the same geometry as the vector icon in
# android/app/src/main/res/drawable/ic_launcher_foreground.xml:
#   - legacy launcher icons (Android 7.x) in android/app/src/main/res/mipmap-*
#   - store/play_icon_512.png            (Google Play app icon)
#   - store/feature_graphic_1024x500.png (Google Play feature graphic)
#   Usage: powershell -File tool/generate_brand_assets.ps1
Add-Type -AssemblyName System.Drawing
Add-Type -AssemblyName System.Windows.Forms

$root = Split-Path -Parent $PSScriptRoot
$teal = [System.Drawing.Color]::FromArgb(0x0F, 0x6E, 0x6E)
$ivory = [System.Drawing.Color]::FromArgb(0xFB, 0xF8, 0xF3)
$marigold = [System.Drawing.Color]::FromArgb(0xE8, 0x91, 0x3A)

# Draws the mark; (ox, oy) is where viewport (0,0) lands, s = pixels per viewport unit.
function Draw-Mark($g, [double]$ox, [double]$oy, [double]$s) {
  $fill = New-Object System.Drawing.SolidBrush $ivory
  function P([double]$v) { $v * $s }
  function Head($cx, $cy, $r, $outline) {
    $rect = New-Object System.Drawing.RectangleF ([float]($ox + (P ($cx - $r)))), ([float]($oy + (P ($cy - $r)))), ([float](P (2 * $r))), ([float](P (2 * $r)))
    $g.FillEllipse($fill, $rect)
    if ($outline) { $pen = New-Object System.Drawing.Pen $teal, ([float](P 2.5)); $g.DrawEllipse($pen, $rect) }
  }
  function Body($x1, $x2, $ys, $yb, $ry, $outline) {
    $rx = ($x2 - $x1) / 2
    $path = New-Object System.Drawing.Drawing2D.GraphicsPath
    $path.AddArc([float]($ox + (P $x1)), [float]($oy + (P ($ys - $ry))), [float](P (2 * $rx)), [float](P (2 * $ry)), 180, 180)
    $path.AddLine([float]($ox + (P $x2)), [float]($oy + (P $ys)), [float]($ox + (P $x2)), [float]($oy + (P $yb)))
    $path.AddLine([float]($ox + (P $x2)), [float]($oy + (P $yb)), [float]($ox + (P $x1)), [float]($oy + (P $yb)))
    $path.CloseFigure()
    $g.FillPath($fill, $path)
    if ($outline) { $pen = New-Object System.Drawing.Pen $teal, ([float](P 2.5)); $g.DrawPath($pen, $path) }
  }
  Head 38 46 5.5 $false; Body 29 47 63 68 8 $false
  Head 70 46 5.5 $false; Body 61 79 63 68 8 $false
  Body 42 66 60 68 10 $true; Head 54 40 7.5 $true
  # Quadratic arc M31,74 Q54,88 77,74 as a cubic Bézier.
  $pen = New-Object System.Drawing.Pen $marigold, ([float](P 3.5))
  $pen.StartCap = 'Round'; $pen.EndCap = 'Round'
  $c1x = 31 + 2 / 3 * (54 - 31); $c1y = 74 + 2 / 3 * (88 - 74)
  $c2x = 77 + 2 / 3 * (54 - 77); $c2y = $c1y
  $g.DrawBezier($pen, [float]($ox + (P 31)), [float]($oy + (P 74)), [float]($ox + (P $c1x)), [float]($oy + (P $c1y)), [float]($ox + (P $c2x)), [float]($oy + (P $c2y)), [float]($ox + (P 77)), [float]($oy + (P 74)))
}

function New-Canvas([int]$w, [int]$h) {
  $bmp = New-Object System.Drawing.Bitmap $w, $h
  $g = [System.Drawing.Graphics]::FromImage($bmp)
  $g.SmoothingMode = 'AntiAlias'; $g.InterpolationMode = 'HighQualityBicubic'; $g.PixelOffsetMode = 'HighQuality'
  $g.TextRenderingHint = 'AntiAliasGridFit'
  return @($bmp, $g)
}

# ---- Legacy launcher icons: teal circle, mark scaled so viewport 18..90 fills the icon.
$sizes = @{ 'mipmap-mdpi' = 48; 'mipmap-hdpi' = 72; 'mipmap-xhdpi' = 96; 'mipmap-xxhdpi' = 144; 'mipmap-xxxhdpi' = 192 }
foreach ($dir in $sizes.Keys) {
  $n = $sizes[$dir]
  $bmp, $g = New-Canvas $n $n
  $g.Clear([System.Drawing.Color]::Transparent)
  $g.FillEllipse((New-Object System.Drawing.SolidBrush $teal), 0, 0, $n - 1, $n - 1)
  $s = $n / 72.0
  Draw-Mark $g (-18 * $s) (-18 * $s) $s
  $bmp.Save((Join-Path $root "android/app/src/main/res/$dir/ic_launcher.png"), [System.Drawing.Imaging.ImageFormat]::Png)
  $g.Dispose(); $bmp.Dispose()
}

# ---- Play Store icon: 512x512 full-bleed square (Play applies its own mask).
New-Item -ItemType Directory -Force (Join-Path $root 'store') | Out-Null
$bmp, $g = New-Canvas 512 512
$g.Clear($teal)
$s = 512 / 80.0
Draw-Mark $g (-14 * $s) (-17 * $s) $s
$bmp.Save((Join-Path $root 'store/play_icon_512.png'), [System.Drawing.Imaging.ImageFormat]::Png)
$g.Dispose(); $bmp.Dispose()

# ---- Feature graphic 1024x500.
$bmp, $g = New-Canvas 1024 500
$g.Clear($teal)
$s = 380 / 108.0
Draw-Mark $g 20 60 $s
$flags = [System.Windows.Forms.TextFormatFlags]::NoPadding -bor [System.Windows.Forms.TextFormatFlags]::NoPrefix
[System.Windows.Forms.TextRenderer]::DrawText($g, 'Parichit', ([System.Drawing.Font]::new('Segoe UI Semibold', 64)), (New-Object System.Drawing.Point 430, 105), $ivory, $flags)
[System.Windows.Forms.TextRenderer]::DrawText($g, 'परिचित', ([System.Drawing.Font]::new('Nirmala UI', 46, [System.Drawing.FontStyle]::Bold)), (New-Object System.Drawing.Point 436, 205), $marigold, $flags)
[System.Windows.Forms.TextRenderer]::DrawText($g, 'Your family tree and everyone you know', ([System.Drawing.Font]::new('Segoe UI', 24)), (New-Object System.Drawing.Point 436, 300), $ivory, $flags)
[System.Windows.Forms.TextRenderer]::DrawText($g, 'Private · Works offline · Hindi & English', ([System.Drawing.Font]::new('Segoe UI', 20)), (New-Object System.Drawing.Point 436, 345), $ivory, $flags)
$bmp.Save((Join-Path $root 'store/feature_graphic_1024x500.png'), [System.Drawing.Imaging.ImageFormat]::Png)
$g.Dispose(); $bmp.Dispose()

'Brand assets generated.'
