function qsup() {

    local now="$(date +'%Y-%m-%d')"
    local bucket="projects"
    local srcDir="$HOME/Documents/qiniu"
    local logFile="$HOME/Projects/qiniu/runtime/log/upload-${now}.log"

    # - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

    # Parse arguments

    while :; do
        case $1 in
            -b|--bucket)
                shift 1
                bucket="$1"
                ;;
            -s|--source)
                shift 1
                srcDir="$1"
                ;;
            -l|--log)
                shift 1
                logFile="$1"
                ;;
            -h|--help)
                printf "%s\n" \
"
Upload data to Qiniu, base on qshell command.

Usage:
    qsup [<Option>] [<Option Value>]

Options:
    -b, --bucket        Bucket name which the data to upload. Default: projects
    -s, --source        Local directory contains the data, FULL PATH only. Default: $HOME/Documents/qiniu
    -l, --log           Log file. Default: /var/log/qiniu/upload-${now}.log
"
                return 0
                ;;
            *)
                break
                ;;
        esac
        shift 1
    done

    # - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

    local conf=\
"
{
   \"src_dir\"            :   \"${srcDir}\",
   \"bucket\"             :   \"${bucket}\",
   \"key_prefix\"         :   \"\",
   \"ignore_dir\"         :   false,
   \"overwrite\"          :   true,
   \"check_exists\"       :   true,
   \"check_hash\"         :   true,
   \"check_size\"         :   false,
   \"rescan_local\"       :   true,
   \"skip_file_prefixes\" :   \"test,demo,\",
   \"skip_path_prefixes\" :   \"test/,temp/\",
   \"skip_fixed_strings\" :   \".svn,.git\",
   \"skip_suffixes\"      :   \".DS_Store,.exe\",
   \"log_file\"           :   \"${logFile}\",
   \"log_level\"          :   \"info\",
   \"log_rotate\"         :   1,
   \"log_stdout\"         :   false,
   \"file_type\"          :   0
}
"

    # - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

    printf "%s" "${conf}" | qshell qupload /dev/stdin

}

function qsdl() {

    local now="$(date +'%Y-%m-%d')"
    local bucket="projects"
    local destDir="$HOME/Documents/qiniu"
    local logFile="$HOME/Projects/qiniu/runtime/log/upload-${now}.log"

    # - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

    # Parse arguments

    while :; do
        case $1 in
            -b|--bucket)
                shift 1
                bucket="$1"
                ;;
            -d|--destination)
                shift 1
                destDir="$1"
                ;;
            -l|--log)
                shift 1
                logFile="$1"
                ;;
            -h|--help)
                printf "%s\n" \
"
Download data from Qiniu, base on qshell command.

Usage:
    qsdl [<Option>] [<Option Value>]

Options:
    -b, --bucket        Bucket name which the data to download. Default: projects
    -d, --destination   Local directory receives the data, FULL PATH only. Default: $HOME/Documents/qiniu
    -l, --log           Log file. Default: /var/log/qiniu/upload-${now}.log
"
                return 0
                ;;
            *)
                break
                ;;
        esac
        shift 1
    done

    # - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

    local conf=\
"
{
   \"dest_dir\"           :   \"${destDir}\",
   \"bucket\"             :   \"${bucket}\",
   \"prefix\"             :   \"\",
   \"suffixes\"           :   \".png,.jpg,.jpeg,.gif\",
   \"cdn_domain\"         :   \"source.winkey.xyz\",
   \"referer\"            :   \"\",
   \"log_file\"           :   \"${logFile}\",
   \"log_level\"          :   \"info\",
   \"log_rotate\"         :   1,
   \"log_stdout\"         :   false
}
"

    # - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

    printf "%s" "${conf}" | qshell qdownload /dev/stdin

}

function update_pac() {

    local SOCKS5_HOST="127.0.0.1"
    local SOCKS5_PORT="1080"
    local PAC_DIR="$HOME/.shadowsocks"
    local PAC_FILE="$PAC_DIR/autoproxy.pac"
    local USER_RULE_FILE="$PAC_DIR/user-rule.txt"

    sudo genpac --format=pac --pac-proxy="SOCKS5 $SOCKS5_HOST:$SOCKS5_PORT" \
         --gfwlist-url="https://raw.githubusercontent.com/gfwlist/gfwlist/master/gfwlist.txt" \
         --user-rule-from="$USER_RULE_FILE" -o="$PAC_FILE"

}
