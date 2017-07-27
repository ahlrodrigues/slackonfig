

# Habilitando init 4
sed -i "s/id:/id:4/g" /etc/inittab

# Habilinatndo pt_BR no /etc/profile.d/lang.sh
sed -i "s/^/#/g" /etc/profile.d/lang.sh
echo "export Português Brasileiro" >> /etc/profile.d/lang.sh
echo "export LINGUAS=pt_BR.UTF-8" >> /etc/profile.d/lang.sh
echo "export LANGUAGE=pt_BR.UTF-8" >> /etc/profile.d/lang.sh
echo "export LANG=pt_BR.UTF-8" >> /etc/profile.d/lang.sh
echo "export LC_ALL=pt_BR.UTF-8" >> /etc/profile.d/lang.sh
echo "export LESSCHARSET=latin1" >> /etc/profile.d/lang.sh

# Habilinatndo pt_BR no /etc/profile.d/lang.sh
cat /etc/profile.d/lang.sh | grep ^export | sed -e "s/export/setenv/g" -e "s/\=/\ /g" >> /etc/profile.d/lang.csh



sed -i "s|^file://mnt/sda3/Slackware/slackware64-current/|file://path/to/some/diretory|g" mirrors


sed -i "/End of/i\export Português Brasileiro\n" lang.sh