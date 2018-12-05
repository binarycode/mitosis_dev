# Mitosis keyboard dev tools

Collection of various development tools, configurations and scripts for Mitosis
keyboard.

## QMK firmware

* `git clone git@github.com:binarycode/qmk_firmware.git -b mitosis_binarycode ../qmk_firmware`
* `pushd qmk`
  * `sudo ./setup.sh`
  * `sudo ./run.sh --flash $(realpath ../../qmk_firmware)`
  * `popd`
