while read -r user ;
do 
echo -e "======================="
echo -e -e "compressing $user"
tar -czf /tmp/users/$user.tar.gz /home/$user
echo -e "completed compressing $user \n ------------"

echo -e "Copying $user.tar.gz to S3"
aws s3 cp /tmp/users/$user.tar.gz s3://bucket_name/
echo -e "Copying completed \n ------------"

echo -e "Removing $user.tar.gz"
rm -f /tmp/users/$user.tar.gz
echo -e "Removed $user.tar.gz \n ------------"

echo -e "=======================\n"
done < /userlist.txt