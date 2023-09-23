#!/usr/bin/env bash

set -euo pipefail

TOOL_NAME="$(basename $(dirname "$(dirname "${BASH_SOURCE[0]}")"))"

[ -f "${plugin_dir}/plugin.config" ] && source "${plugin_dir}/plugin.config"

fail() {
	echo -e "asdf-$TOOL_NAME: $*"
	exit 1
}

curl_opts=(-fsSL)

if [ -n "${GITHUB_API_TOKEN:-}" ]; then
	curl_opts=("${curl_opts[@]}" -H "Authorization: token $GITHUB_API_TOKEN")
fi

sort_versions() {
	sed 'h; s/[+-]/./g; s/.p\([[:digit:]]\)/.z\1/; s/$/.z/; G; s/\n/ /' |
		LC_ALL=C sort -t. -k 1,1 -k 2,2n -k 3,3n -k 4,4n -k 5,5n | awk '{print $2}'
}

list_all_versions() {
	echo latest
}

download_release() {
	local version="$1"
	local filename="$2"
	local url="$ASDF_PLUGIN_DOWNLOAD_URL"

	echo "* Downloading $TOOL_NAME release $version..."
	curl "${curl_opts[@]}" -o "$filename" -C - "$url" || fail "Could not download $url"
}

install_version() {
	local install_type="$1"
	local version="$2"
	local install_path="${3%/bin}/bin"

	if [ "$install_type" != "version" ]; then
		fail "asdf-${TOOL_NAME} supports release installs only"
	fi

	(
		mkdir -p "$install_path"
		cp -r "$ASDF_DOWNLOAD_PATH"/* "$install_path"

		echo "$TOOL_NAME $version installation was successful!"
	) || (
		rm -rf "$install_path"
		fail "An error occurred while installing $TOOL_NAME $version."
	)
}

setup_plugin_config() {
	local plugin_dir="$1"
	if  [ ! -f "${plugin_dir}/plugin.config" ]; then
		local env_names="ASDF_PLUGIN_DOWNLOAD_URL"
		for name in $env_names; do
			local value="$(eval echo \$$name)"
			[ -z "$value" ] && fail "Required environment variable $name not set"
			echo "$name=$value" >> "${plugin_dir}/plugin.config"
		done
		echo "export ${env_names}" >> "${plugin_dir}/plugin.config"
	fi
}
