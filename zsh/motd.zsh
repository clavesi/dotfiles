centered_cowsay() {
    local wrap=$1 cowfile=$2 termcols out maxlen=0 pad
    local -a lines

    termcols=$(tput cols)

    # 1) capture the full cowsay output
    out=$(cowsay -W "$wrap" -f "$cowfile")

    # 2) split into lines and find the longest one
    while IFS= read -r line; do
        lines+=("$line")
        (( ${#line} > maxlen )) && maxlen=${#line}
    done <<< "$out"

    # 3) compute a single pad for the whole block
    pad=$(( (termcols - maxlen) / 2 ))
    (( pad < 0 )) && pad=0

    # 4) print each line with that pad
    for line in "${lines[@]}"; do
        printf "%*s%s\n" "$pad" "" "$line"
    done
}

# ─── 1) CONFIGURATION ────────────────────────────────────────────────
MOTD_MESSAGE="${MOTD_MESSAGE:-clavesi}"

COWSAY_FACES=(tux dragon vader)
# Pick one at random
COWFILE=${COWSAY_FACES[$(( RANDOM % ${#COWSAY_FACES[@]} + 1 ))]}

# ─── 2) RENDER & PIPE ───────────────────────────────────────────────
{
    if command -v figlet >/dev/null 2>&1; then
        figlet -w "$(tput cols)" -f starwars -c "$MOTD_MESSAGE"
    else
        echo "$MOTD_MESSAGE"
    fi

    if command -v fortune >/dev/null 2>&1 && command -v cowsay >/dev/null 2>&1; then
        cols=$(tput cols)
        wrap=$(( cols / 2 ))
        fortune | centered_cowsay $wrap $COWFILE
    fi
} | lolcat
