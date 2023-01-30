[/system/bin/rild]
mode: 0750
user: root
group: shell
caps: BLOCK_SUSPEND NET_ADMIN NET_RAW

[/system/bin/mtpd]
mode: 0750
user: root
group: shell
caps: NET_ADMIN NET_RAW

[/system/bin/racoon]
mode: 0750
user: root
group: shell
caps: NET_ADMIN NET_BIND_SERVICE NET_RAW


[/vendor/bin/hw/android.hardware.camera.provider@2.4-service]
mode: 0750
user: root
group: shell
caps: SYS_NICE

[/vendor/bin/hw/android.hardware.sensors@1.0-service]
mode: 0750
user: root
group: shell
caps: BLOCK_SUSPEND SYS_NICE

[/system/bin/lpm]
mode: 0750
user: root
group: shell
caps: NET_ADMIN 

