# alpine-apache2-codeigniter4-php74
codeigniter4 installed on apline server

not use composer, install manually

# Setting Stack
- Apline:edge
- Apache24
- PHP7.4.23
- Codeigniter 4

# Usage
1. git clone proeject
```
git clone https://github.com/Master-Hun/alpine-apache2-codeigniter4-php74.git
```

2. build docker image
```
docker build --tag alpine_ci4:dev .
```

3. run docker container
```
docker run -itd --name alpine_ci4_contanier -p 80:80 alpine_ci4:dev
```

Then you see the codeigniter 4 welcome page.


That's It.


# Change Configure List

1. config/php.ini
```
// line 187
short_open_tag = Off -> On
```

2. config/httpd.conf 

```
// line 138
# LoadModule session_module modules/mod_session.so -> remove "#" 

// line 166
# LoadModule rewrite_module modules/mod_rewrite.so -> remove "#" 
```




