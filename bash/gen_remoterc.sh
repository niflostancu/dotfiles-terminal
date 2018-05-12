# Generates a concatenated bashrc for use with remote shells (SSH)

function script_remote_delete()
{
    sed -e '/#{REMOTE DELETE}/,/#{\/REMOTE DELETE}/d'
}

function script_include_theme()
{
    sed -e '/#{INCLUDE bash_theme\.sh}/ {' -e "d;" -e 'r bash_theme.sh;' -e "}"
}

function generaterc()
{
    cat bashrc | script_include_theme | script_remote_delete
}

if [[ -n "$1" ]]; then
    generaterc > "$1"
else
    generaterc
fi

