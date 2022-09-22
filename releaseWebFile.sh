s3bucket=$(<s3.txt)
distid=$(<dist.txt)
aws s3 cp min/greatesthits.html ${s3bucket}greatesthits.html --acl public-read

aws s3 cp min/greatesthits.css ${s3bucket}greatesthits.css --acl public-read

aws s3 cp min/greatesthits.js ${s3bucket}greatesthits.js --acl public-read

aws s3 cp min/greatesthitsconfig.js ${s3bucket}greatesthitsconfig.js --acl public-read

aws s3 cp min/greatesthitsfirstcall.js ${s3bucket}greatesthitsfirstcall.js --acl public-read

aws cloudfront create-invalidation --distribution-id ${distid} --paths "/greatesthits/greatesthits.html" "/greatesthits/greatesthits.css" "/greatesthits/greatesthits.js" "/greatesthits/greatesthitsconfig.js" "/greatesthits/greatesthitsfirstcall.js"
