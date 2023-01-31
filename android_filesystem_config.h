/*
 * Copyright (C) 2015 The Android Open Source Project
 *
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *      http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */

/* This file is used to enhance the properties of the filesystem
** images generated by build tools (mkbootfs and mkyaffs2image) and
** by the device side of adb.
*/

/*
** Resorting to the default file means someone requested fs_config_dirs or
** fs_config_files in their device configuration without providing an
** associated header.
*/
//#warning No device-supplied android_filesystem_config.h, using empty default.

/* Rules for directories.
** These rules are applied based on "first match", so they
** should start with the most specific path and work their
** way up to the root.
*/

#define NO_ANDROID_FILESYSTEM_CONFIG_DEVICE_DIRS 1 /* opt out of specifying */

/* Rules for files.
** These rules are applied based on "first match", so they
** should start with the most specific path and work their
** way up to the root. Prefixes ending in * denotes wildcard
** and will allow partial matches.
*/

//#define NO_ANDROID_FILESYSTEM_CONFIG_DEVICE_FILES 1 /* opt out of specifying */
static const struct fs_path_config android_device_files[] = {
	{ 
		00750, AID_ROOT, AID_SHELL, 
		(1ULL << CAP_BLOCK_SUSPEND) | (1ULL << CAP_NET_ADMIN) | (1ULL << CAP_NET_RAW), 
		"/system/bin/rild" 
	},
	{ 
		00750, AID_ROOT, AID_SHELL, 
		(1ULL << CAP_NET_ADMIN) | (1ULL << CAP_NET_RAW), 
		"/system/bin/mtpd" 
	},
	{ 
		00750, AID_ROOT, AID_SHELL, 
		(1ULL << CAP_NET_ADMIN) | (1ULL << CAP_NET_BIND_SERVICE) | (1ULL << CAP_NET_RAW), 
		"/system/bin/racoon" 
	},
	{ 
		00750, AID_ROOT, AID_SHELL, 
		(1ULL << CAP_NET_ADMIN), 
		"/system/bin/lpm" 
	},


};

