function Resolve-M1LocalizedText {
  param([pscustomobject]$Row, [string]$Locale)
  $value = $Row.$Locale
  if ([string]::IsNullOrWhiteSpace($value)) { return [string]$Row.en }
  return [string]$value
}
