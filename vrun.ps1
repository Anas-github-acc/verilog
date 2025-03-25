# Stop on errors
$ErrorActionPreference = "Stop"

# Check if file path is provided
if ($args.Count -eq 0) {
    Write-Host "Usage: .\run.ps1 <path_to_verilog_file>"
    exit 1
}

# Get file path from argument
$file_path = $args[0]

# Extract file name without extension
$file_name = [System.IO.Path]::GetFileNameWithoutExtension($file_path)

# Compile Verilog file using iverilog
Write-Host "Compiling $file_path..."
Start-Process -NoNewWindow -Wait -FilePath "iverilog" -ArgumentList "-o `"$file_name.out`" `"$file_path`""

# Run the compiled Verilog file using vvp
Write-Host "Running $file_name.out..."
Start-Process -NoNewWindow -Wait -FilePath "vvp" -ArgumentList "`"$file_name.out`""

# Cleanup the output file (optional)
Remove-Item "$file_name.out" -ErrorAction SilentlyContinue

Write-Host "Execution completed."
