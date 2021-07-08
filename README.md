# openwrt-alpine-fan-control
Control the fans on the Netgear R9000 and XR700.

## Usage

The packages in this repository implement the ``alpine-fan-control`` daemon, and ``luci-app-alpine-fan-control`` configuration interface.

The fan control script borrows heavily from [amdgpu-fancontrol](https://github.com/grmat/amdgpu-fancontrol), as it implements linear slope/interpolation for the fan curve instead of the stock firmware's flat cutoffs.

## Dependencies

This package depends on ``bash``, due to the use of arrays. PRs to remove the dependency on ``bash`` are most welcome.

## Building

### Step 1
To build alpine-fan-control for OpenWrt, first add this feed to your ``feeds.conf`` in a fully set-up OpenWrt SDK [(read here on how to setup the OpenWrt SDK)](https://openwrt.org/docs/guide-developer/using_the_sdk):

```
echo "src-git alpinefancontrol https://github.com/hurrian/openwrt-alpine-fan-control.git" >> feeds.conf

$ ./scripts/feeds update -a
$ ./scripts/feeds install -a
```

### Step 2
Enable building the packages.
```
make menuconfig

Utilities -> Shells -> bash <*>
LuCI -> 3. Applications -> luci-app-alpine-fan-control <*>
Utilities -> alpine-fan-control <*>
```

### Step 3
Build the packages.
```
make package/luci-app-alpine-fan-control/compile
make package/alpine-fan-control/compile
```

### Step 4
Install the packages to your router.
```
opkg install /tmp/alpine-fan-control-*.ipk
opkg install /tmp/luci-app-alpine-fan-control-*.ipk
```

## License
GPL-v3.0
