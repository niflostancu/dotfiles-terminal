# SSH Utils module

# Auto bashrc propagation over SSH
# Inspired by https://superuser.com/questions/587870/auto-propagation-of-bash-settings-across-many-machines
function ssr() {
    ssh $@ -t "
    REMOTERC=\"\$HOME/.$USER.bashrc\"
    if [[ -z \"$BASHRC_PUBLIC_URL\" ]]; then echo \"Error: No BASHRC_PUBLIC_URL defined!\"; exec bash; fi
    find \"\$REMOTERC\" -mmin +120 -quit 2>/dev/null || wget --quiet -N "$BASHRC_PUBLIC_URL" -O \"\$REMOTERC\";
    exec bash --rcfile \"\$REMOTERC\""
}

# SSH aliases
alias ssx="ssr -o StrictHostKeyChecking=no -o UserKnownHostsFile=/dev/null"
alias scpx="scp -o StrictHostKeyChecking=no -o UserKnownHostsFile=/dev/null"

