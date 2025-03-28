#I Verilog Runner

This contain all the verilog from sem3

## Pre-requisite

- Icarus Verilog
- GTKWave

## How to run

### Use the script

# Note - Before running the script

- make sure you have the permission to execute the script. If not, run `chmod +x vrun`
- to run the script, use `./vrun <file_path>` at the location of the script and in the testbench import the modules from the script path
e.g.,
to run the pipeline.v file, follow the below steps

```bash
include "pipelines/pipeline.v" # add the line in the testbench file 'pipelines/pipeline_tb.v'
./vrun "pipelines/pipeline_tb.v" # run the script
gtkwave pipeline_tb.vcd # open the gtk
```

Linux/ or MacOS

```bash
vrun "<file_path>"
gtkwave <output_file>.vcd # Only necessary if you want to open the gtkwave
```

Windows

```powershell
.\vrun "<file_path>"
gtkwave <output_file>.vcd # Only necessary if you want to open the gtkwave
```

### Manually

```bash
iverilog -o <output_file> <input_file>
vvp <output_file>
gtkwave <output_file>.vcd
```

## Contribution

Any one is allowed to contribute to this repository. Just fork the repository and create a pull request.

### Steps

1. Fork the repository
2. Clone the repository `git clone https://github.com/Anas-github-acc/verilog.git`
3. Create a new branch `git checkout -b <branch_name>`
4. Make changes
5. Add changes to the staging area `git add .`
6. Commit changes `git commit -m "commit message"`
7. Push changes `git push origin <branch_name>`
8. Create a pull request
