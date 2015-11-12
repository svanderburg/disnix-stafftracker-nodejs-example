{buildNodePackage, fetchurl, fetchgit, self}:

let
  registry = {
    "roomservice-0.0.1" = buildNodePackage {
      name = "roomservice";
      version = "0.0.1";
      src = ./.;
      dependencies = {
        express = {
          "4.x.x" = {
            version = "4.13.3";
            pkg = self."express-4.13.3";
          };
        };
        express-validator = {
          "2.18.x" = {
            version = "2.18.0";
            pkg = self."express-validator-2.18.0";
          };
        };
        mongodb = {
          "~2.0" = {
            version = "2.0.48";
            pkg = self."mongodb-2.0.48";
          };
        };
        slasp = {
          "0.0.4" = {
            version = "0.0.4";
            pkg = self."slasp-0.0.4";
          };
        };
      };
      meta = {
        description = "REST API interface providing access to the rooms data set";
        license = "MIT";
      };
      production = true;
      linkDependencies = false;
    };
    "express-4.13.3" = buildNodePackage {
      name = "express";
      version = "4.13.3";
      src = fetchurl {
        url = "http://registry.npmjs.org/express/-/express-4.13.3.tgz";
        sha1 = "ddb2f1fb4502bf33598d2b032b037960ca6c80a3";
      };
      dependencies = {
        accepts = {
          "~1.2.12" = {
            version = "1.2.13";
            pkg = self."accepts-1.2.13";
          };
        };
        array-flatten = {
          "1.1.1" = {
            version = "1.1.1";
            pkg = self."array-flatten-1.1.1";
          };
        };
        content-disposition = {
          "0.5.0" = {
            version = "0.5.0";
            pkg = self."content-disposition-0.5.0";
          };
        };
        content-type = {
          "~1.0.1" = {
            version = "1.0.1";
            pkg = self."content-type-1.0.1";
          };
        };
        cookie = {
          "0.1.3" = {
            version = "0.1.3";
            pkg = self."cookie-0.1.3";
          };
        };
        cookie-signature = {
          "1.0.6" = {
            version = "1.0.6";
            pkg = self."cookie-signature-1.0.6";
          };
        };
        debug = {
          "~2.2.0" = {
            version = "2.2.0";
            pkg = self."debug-2.2.0";
          };
        };
        depd = {
          "~1.0.1" = {
            version = "1.0.1";
            pkg = self."depd-1.0.1";
          };
        };
        escape-html = {
          "1.0.2" = {
            version = "1.0.2";
            pkg = self."escape-html-1.0.2";
          };
        };
        etag = {
          "~1.7.0" = {
            version = "1.7.0";
            pkg = self."etag-1.7.0";
          };
        };
        finalhandler = {
          "0.4.0" = {
            version = "0.4.0";
            pkg = self."finalhandler-0.4.0";
          };
        };
        fresh = {
          "0.3.0" = {
            version = "0.3.0";
            pkg = self."fresh-0.3.0";
          };
        };
        merge-descriptors = {
          "1.0.0" = {
            version = "1.0.0";
            pkg = self."merge-descriptors-1.0.0";
          };
        };
        methods = {
          "~1.1.1" = {
            version = "1.1.1";
            pkg = self."methods-1.1.1";
          };
        };
        on-finished = {
          "~2.3.0" = {
            version = "2.3.0";
            pkg = self."on-finished-2.3.0";
          };
        };
        parseurl = {
          "~1.3.0" = {
            version = "1.3.0";
            pkg = self."parseurl-1.3.0";
          };
        };
        path-to-regexp = {
          "0.1.7" = {
            version = "0.1.7";
            pkg = self."path-to-regexp-0.1.7";
          };
        };
        proxy-addr = {
          "~1.0.8" = {
            version = "1.0.8";
            pkg = self."proxy-addr-1.0.8";
          };
        };
        qs = {
          "4.0.0" = {
            version = "4.0.0";
            pkg = self."qs-4.0.0";
          };
        };
        range-parser = {
          "~1.0.2" = {
            version = "1.0.3";
            pkg = self."range-parser-1.0.3";
          };
        };
        send = {
          "0.13.0" = {
            version = "0.13.0";
            pkg = self."send-0.13.0";
          };
        };
        serve-static = {
          "~1.10.0" = {
            version = "1.10.0";
            pkg = self."serve-static-1.10.0";
          };
        };
        type-is = {
          "~1.6.6" = {
            version = "1.6.9";
            pkg = self."type-is-1.6.9";
          };
        };
        utils-merge = {
          "1.0.0" = {
            version = "1.0.0";
            pkg = self."utils-merge-1.0.0";
          };
        };
        vary = {
          "~1.0.1" = {
            version = "1.0.1";
            pkg = self."vary-1.0.1";
          };
        };
      };
      meta = {
        description = "Fast, unopinionated, minimalist web framework";
        homepage = http://expressjs.com/;
        license = "MIT";
      };
      production = true;
      linkDependencies = false;
    };
    "accepts-1.2.13" = buildNodePackage {
      name = "accepts";
      version = "1.2.13";
      src = fetchurl {
        url = "http://registry.npmjs.org/accepts/-/accepts-1.2.13.tgz";
        sha1 = "e5f1f3928c6d95fd96558c36ec3d9d0de4a6ecea";
      };
      dependencies = {
        mime-types = {
          "~2.1.6" = {
            version = "2.1.7";
            pkg = self."mime-types-2.1.7";
          };
        };
        negotiator = {
          "0.5.3" = {
            version = "0.5.3";
            pkg = self."negotiator-0.5.3";
          };
        };
      };
      meta = {
        description = "Higher-level content negotiation";
        homepage = https://github.com/jshttp/accepts;
        license = "MIT";
      };
      production = true;
      linkDependencies = false;
    };
    "mime-types-2.1.7" = buildNodePackage {
      name = "mime-types";
      version = "2.1.7";
      src = fetchurl {
        url = "http://registry.npmjs.org/mime-types/-/mime-types-2.1.7.tgz";
        sha1 = "ff603970e3c731ef6f7f4df3c9a0f463a13c2755";
      };
      dependencies = {
        mime-db = {
          "~1.19.0" = {
            version = "1.19.0";
            pkg = self."mime-db-1.19.0";
          };
        };
      };
      meta = {
        description = "The ultimate javascript content-type utility.";
        homepage = https://github.com/jshttp/mime-types;
        license = "MIT";
      };
      production = true;
      linkDependencies = false;
    };
    "mime-db-1.19.0" = buildNodePackage {
      name = "mime-db";
      version = "1.19.0";
      src = fetchurl {
        url = "http://registry.npmjs.org/mime-db/-/mime-db-1.19.0.tgz";
        sha1 = "496a18198a7ce8244534e25bb102b74fb420fd56";
      };
      meta = {
        description = "Media Type Database";
        homepage = https://github.com/jshttp/mime-db;
        license = "MIT";
      };
      production = true;
      linkDependencies = false;
    };
    "mime-db-~1.19.0" = self."mime-db-1.19.0";
    "mime-types-~2.1.6" = self."mime-types-2.1.7";
    "negotiator-0.5.3" = buildNodePackage {
      name = "negotiator";
      version = "0.5.3";
      src = fetchurl {
        url = "http://registry.npmjs.org/negotiator/-/negotiator-0.5.3.tgz";
        sha1 = "269d5c476810ec92edbe7b6c2f28316384f9a7e8";
      };
      meta = {
        description = "HTTP content negotiation";
        homepage = https://github.com/jshttp/negotiator;
        license = "MIT";
      };
      production = true;
      linkDependencies = false;
    };
    "accepts-~1.2.12" = self."accepts-1.2.13";
    "array-flatten-1.1.1" = buildNodePackage {
      name = "array-flatten";
      version = "1.1.1";
      src = fetchurl {
        url = "http://registry.npmjs.org/array-flatten/-/array-flatten-1.1.1.tgz";
        sha1 = "9a5f699051b1e7073328f2a008968b64ea2955d2";
      };
      meta = {
        description = "Flatten an array of nested arrays into a single flat array";
        homepage = https://github.com/blakeembrey/array-flatten;
        license = "MIT";
      };
      production = true;
      linkDependencies = false;
    };
    "content-disposition-0.5.0" = buildNodePackage {
      name = "content-disposition";
      version = "0.5.0";
      src = fetchurl {
        url = "http://registry.npmjs.org/content-disposition/-/content-disposition-0.5.0.tgz";
        sha1 = "4284fe6ae0630874639e44e80a418c2934135e9e";
      };
      meta = {
        description = "Create and parse Content-Disposition header";
        homepage = https://github.com/jshttp/content-disposition;
        license = "MIT";
      };
      production = true;
      linkDependencies = false;
    };
    "content-type-1.0.1" = buildNodePackage {
      name = "content-type";
      version = "1.0.1";
      src = fetchurl {
        url = "http://registry.npmjs.org/content-type/-/content-type-1.0.1.tgz";
        sha1 = "a19d2247327dc038050ce622b7a154ec59c5e600";
      };
      meta = {
        description = "Create and parse HTTP Content-Type header";
        homepage = https://github.com/jshttp/content-type;
        license = "MIT";
      };
      production = true;
      linkDependencies = false;
    };
    "content-type-~1.0.1" = self."content-type-1.0.1";
    "cookie-0.1.3" = buildNodePackage {
      name = "cookie";
      version = "0.1.3";
      src = fetchurl {
        url = "http://registry.npmjs.org/cookie/-/cookie-0.1.3.tgz";
        sha1 = "e734a5c1417fce472d5aef82c381cabb64d1a435";
      };
      meta = {
        description = "cookie parsing and serialization";
        homepage = https://github.com/jshttp/cookie;
        license = "MIT";
      };
      production = true;
      linkDependencies = false;
    };
    "cookie-signature-1.0.6" = buildNodePackage {
      name = "cookie-signature";
      version = "1.0.6";
      src = fetchurl {
        url = "http://registry.npmjs.org/cookie-signature/-/cookie-signature-1.0.6.tgz";
        sha1 = "e303a882b342cc3ee8ca513a79999734dab3ae2c";
      };
      dependencies = {};
      meta = {
        description = "Sign and unsign cookies";
        homepage = https://github.com/visionmedia/node-cookie-signature;
        license = "MIT";
      };
      production = true;
      linkDependencies = false;
    };
    "debug-2.2.0" = buildNodePackage {
      name = "debug";
      version = "2.2.0";
      src = fetchurl {
        url = "http://registry.npmjs.org/debug/-/debug-2.2.0.tgz";
        sha1 = "f87057e995b1a1f6ae6a4960664137bc56f039da";
      };
      dependencies = {
        ms = {
          "0.7.1" = {
            version = "0.7.1";
            pkg = self."ms-0.7.1";
          };
        };
      };
      meta = {
        description = "small debugging utility";
        homepage = https://github.com/visionmedia/debug;
        license = "MIT";
      };
      production = true;
      linkDependencies = false;
    };
    "ms-0.7.1" = buildNodePackage {
      name = "ms";
      version = "0.7.1";
      src = fetchurl {
        url = "http://registry.npmjs.org/ms/-/ms-0.7.1.tgz";
        sha1 = "9cd13c03adbff25b65effde7ce864ee952017098";
      };
      meta = {
        description = "Tiny ms conversion utility";
        homepage = https://github.com/guille/ms.js;
      };
      production = true;
      linkDependencies = false;
    };
    "debug-~2.2.0" = self."debug-2.2.0";
    "depd-1.0.1" = buildNodePackage {
      name = "depd";
      version = "1.0.1";
      src = fetchurl {
        url = "http://registry.npmjs.org/depd/-/depd-1.0.1.tgz";
        sha1 = "80aec64c9d6d97e65cc2a9caa93c0aa6abf73aaa";
      };
      meta = {
        description = "Deprecate all the things";
        homepage = https://github.com/dougwilson/nodejs-depd;
        license = "MIT";
      };
      production = true;
      linkDependencies = false;
    };
    "depd-~1.0.1" = self."depd-1.0.1";
    "escape-html-1.0.2" = buildNodePackage {
      name = "escape-html";
      version = "1.0.2";
      src = fetchurl {
        url = "http://registry.npmjs.org/escape-html/-/escape-html-1.0.2.tgz";
        sha1 = "d77d32fa98e38c2f41ae85e9278e0e0e6ba1022c";
      };
      meta = {
        description = "Escape HTML entities";
        homepage = https://github.com/component/escape-html;
        license = "MIT";
      };
      production = true;
      linkDependencies = false;
    };
    "etag-1.7.0" = buildNodePackage {
      name = "etag";
      version = "1.7.0";
      src = fetchurl {
        url = "http://registry.npmjs.org/etag/-/etag-1.7.0.tgz";
        sha1 = "03d30b5f67dd6e632d2945d30d6652731a34d5d8";
      };
      meta = {
        description = "Create simple ETags";
        homepage = https://github.com/jshttp/etag;
        license = "MIT";
      };
      production = true;
      linkDependencies = false;
    };
    "etag-~1.7.0" = self."etag-1.7.0";
    "finalhandler-0.4.0" = buildNodePackage {
      name = "finalhandler";
      version = "0.4.0";
      src = fetchurl {
        url = "http://registry.npmjs.org/finalhandler/-/finalhandler-0.4.0.tgz";
        sha1 = "965a52d9e8d05d2b857548541fb89b53a2497d9b";
      };
      dependencies = {
        debug = {
          "~2.2.0" = {
            version = "2.2.0";
            pkg = self."debug-2.2.0";
          };
        };
        escape-html = {
          "1.0.2" = {
            version = "1.0.2";
            pkg = self."escape-html-1.0.2";
          };
        };
        on-finished = {
          "~2.3.0" = {
            version = "2.3.0";
            pkg = self."on-finished-2.3.0";
          };
        };
        unpipe = {
          "~1.0.0" = {
            version = "1.0.0";
            pkg = self."unpipe-1.0.0";
          };
        };
      };
      meta = {
        description = "Node.js final http responder";
        homepage = https://github.com/pillarjs/finalhandler;
        license = "MIT";
      };
      production = true;
      linkDependencies = false;
    };
    "on-finished-2.3.0" = buildNodePackage {
      name = "on-finished";
      version = "2.3.0";
      src = fetchurl {
        url = "http://registry.npmjs.org/on-finished/-/on-finished-2.3.0.tgz";
        sha1 = "20f1336481b083cd75337992a16971aa2d906947";
      };
      dependencies = {
        ee-first = {
          "1.1.1" = {
            version = "1.1.1";
            pkg = self."ee-first-1.1.1";
          };
        };
      };
      meta = {
        description = "Execute a callback when a request closes, finishes, or errors";
        homepage = https://github.com/jshttp/on-finished;
        license = "MIT";
      };
      production = true;
      linkDependencies = false;
    };
    "ee-first-1.1.1" = buildNodePackage {
      name = "ee-first";
      version = "1.1.1";
      src = fetchurl {
        url = "http://registry.npmjs.org/ee-first/-/ee-first-1.1.1.tgz";
        sha1 = "590c61156b0ae2f4f0255732a158b266bc56b21d";
      };
      meta = {
        description = "return the first event in a set of ee/event pairs";
        homepage = https://github.com/jonathanong/ee-first;
        license = "MIT";
      };
      production = true;
      linkDependencies = false;
    };
    "on-finished-~2.3.0" = self."on-finished-2.3.0";
    "unpipe-1.0.0" = buildNodePackage {
      name = "unpipe";
      version = "1.0.0";
      src = fetchurl {
        url = "http://registry.npmjs.org/unpipe/-/unpipe-1.0.0.tgz";
        sha1 = "b2bf4ee8514aae6165b4817829d21b2ef49904ec";
      };
      meta = {
        description = "Unpipe a stream from all destinations";
        homepage = https://github.com/stream-utils/unpipe;
        license = "MIT";
      };
      production = true;
      linkDependencies = false;
    };
    "unpipe-~1.0.0" = self."unpipe-1.0.0";
    "fresh-0.3.0" = buildNodePackage {
      name = "fresh";
      version = "0.3.0";
      src = fetchurl {
        url = "http://registry.npmjs.org/fresh/-/fresh-0.3.0.tgz";
        sha1 = "651f838e22424e7566de161d8358caa199f83d4f";
      };
      meta = {
        description = "HTTP response freshness testing";
        homepage = https://github.com/jshttp/fresh;
        license = "MIT";
      };
      production = true;
      linkDependencies = false;
    };
    "merge-descriptors-1.0.0" = buildNodePackage {
      name = "merge-descriptors";
      version = "1.0.0";
      src = fetchurl {
        url = "http://registry.npmjs.org/merge-descriptors/-/merge-descriptors-1.0.0.tgz";
        sha1 = "2169cf7538e1b0cc87fb88e1502d8474bbf79864";
      };
      meta = {
        description = "Merge objects using descriptors";
        homepage = https://github.com/component/merge-descriptors;
        license = "MIT";
      };
      production = true;
      linkDependencies = false;
    };
    "methods-1.1.1" = buildNodePackage {
      name = "methods";
      version = "1.1.1";
      src = fetchurl {
        url = "http://registry.npmjs.org/methods/-/methods-1.1.1.tgz";
        sha1 = "17ea6366066d00c58e375b8ec7dfd0453c89822a";
      };
      meta = {
        description = "HTTP methods that node supports";
        homepage = https://github.com/jshttp/methods;
        license = "MIT";
      };
      production = true;
      linkDependencies = false;
    };
    "methods-~1.1.1" = self."methods-1.1.1";
    "parseurl-1.3.0" = buildNodePackage {
      name = "parseurl";
      version = "1.3.0";
      src = fetchurl {
        url = "http://registry.npmjs.org/parseurl/-/parseurl-1.3.0.tgz";
        sha1 = "b58046db4223e145afa76009e61bac87cc2281b3";
      };
      meta = {
        description = "parse a url with memoization";
        homepage = https://github.com/expressjs/parseurl;
        license = "MIT";
      };
      production = true;
      linkDependencies = false;
    };
    "parseurl-~1.3.0" = self."parseurl-1.3.0";
    "path-to-regexp-0.1.7" = buildNodePackage {
      name = "path-to-regexp";
      version = "0.1.7";
      src = fetchurl {
        url = "http://registry.npmjs.org/path-to-regexp/-/path-to-regexp-0.1.7.tgz";
        sha1 = "df604178005f522f15eb4490e7247a1bfaa67f8c";
      };
      meta = {
        description = "Express style path to RegExp utility";
        homepage = "https://github.com/component/path-to-regexp#readme";
        license = "MIT";
      };
      production = true;
      linkDependencies = false;
    };
    "proxy-addr-1.0.8" = buildNodePackage {
      name = "proxy-addr";
      version = "1.0.8";
      src = fetchurl {
        url = "http://registry.npmjs.org/proxy-addr/-/proxy-addr-1.0.8.tgz";
        sha1 = "db54ec878bcc1053d57646609219b3715678bafe";
      };
      dependencies = {
        forwarded = {
          "~0.1.0" = {
            version = "0.1.0";
            pkg = self."forwarded-0.1.0";
          };
        };
        "ipaddr.js" = {
          "1.0.1" = {
            version = "1.0.1";
            pkg = self."ipaddr.js-1.0.1";
          };
        };
      };
      meta = {
        description = "Determine address of proxied request";
        homepage = https://github.com/jshttp/proxy-addr;
        license = "MIT";
      };
      production = true;
      linkDependencies = false;
    };
    "forwarded-0.1.0" = buildNodePackage {
      name = "forwarded";
      version = "0.1.0";
      src = fetchurl {
        url = "http://registry.npmjs.org/forwarded/-/forwarded-0.1.0.tgz";
        sha1 = "19ef9874c4ae1c297bcf078fde63a09b66a84363";
      };
      meta = {
        description = "Parse HTTP X-Forwarded-For header";
        homepage = https://github.com/jshttp/forwarded;
        license = "MIT";
      };
      production = true;
      linkDependencies = false;
    };
    "forwarded-~0.1.0" = self."forwarded-0.1.0";
    "ipaddr.js-1.0.1" = buildNodePackage {
      name = "ipaddr.js";
      version = "1.0.1";
      src = fetchurl {
        url = "http://registry.npmjs.org/ipaddr.js/-/ipaddr.js-1.0.1.tgz";
        sha1 = "5f38801dc73e0400fc7076386f6ed5215fbd8f95";
      };
      dependencies = {};
      meta = {
        description = "A library for manipulating IPv4 and IPv6 addresses in JavaScript.";
        license = "MIT";
      };
      production = true;
      linkDependencies = false;
    };
    "proxy-addr-~1.0.8" = self."proxy-addr-1.0.8";
    "qs-4.0.0" = buildNodePackage {
      name = "qs";
      version = "4.0.0";
      src = fetchurl {
        url = "http://registry.npmjs.org/qs/-/qs-4.0.0.tgz";
        sha1 = "c31d9b74ec27df75e543a86c78728ed8d4623607";
      };
      dependencies = {};
      meta = {
        description = "A querystring parser that supports nesting and arrays, with a depth limit";
        homepage = https://github.com/hapijs/qs;
        license = "BSD-3-Clause";
      };
      production = true;
      linkDependencies = false;
    };
    "range-parser-1.0.3" = buildNodePackage {
      name = "range-parser";
      version = "1.0.3";
      src = fetchurl {
        url = "http://registry.npmjs.org/range-parser/-/range-parser-1.0.3.tgz";
        sha1 = "6872823535c692e2c2a0103826afd82c2e0ff175";
      };
      meta = {
        description = "Range header field string parser";
        homepage = https://github.com/jshttp/range-parser;
        license = "MIT";
      };
      production = true;
      linkDependencies = false;
    };
    "range-parser-~1.0.2" = self."range-parser-1.0.3";
    "send-0.13.0" = buildNodePackage {
      name = "send";
      version = "0.13.0";
      src = fetchurl {
        url = "http://registry.npmjs.org/send/-/send-0.13.0.tgz";
        sha1 = "518f921aeb0560aec7dcab2990b14cf6f3cce5de";
      };
      dependencies = {
        debug = {
          "~2.2.0" = {
            version = "2.2.0";
            pkg = self."debug-2.2.0";
          };
        };
        depd = {
          "~1.0.1" = {
            version = "1.0.1";
            pkg = self."depd-1.0.1";
          };
        };
        destroy = {
          "1.0.3" = {
            version = "1.0.3";
            pkg = self."destroy-1.0.3";
          };
        };
        escape-html = {
          "1.0.2" = {
            version = "1.0.2";
            pkg = self."escape-html-1.0.2";
          };
        };
        etag = {
          "~1.7.0" = {
            version = "1.7.0";
            pkg = self."etag-1.7.0";
          };
        };
        fresh = {
          "0.3.0" = {
            version = "0.3.0";
            pkg = self."fresh-0.3.0";
          };
        };
        http-errors = {
          "~1.3.1" = {
            version = "1.3.1";
            pkg = self."http-errors-1.3.1";
          };
        };
        mime = {
          "1.3.4" = {
            version = "1.3.4";
            pkg = self."mime-1.3.4";
          };
        };
        ms = {
          "0.7.1" = {
            version = "0.7.1";
            pkg = self."ms-0.7.1";
          };
        };
        on-finished = {
          "~2.3.0" = {
            version = "2.3.0";
            pkg = self."on-finished-2.3.0";
          };
        };
        range-parser = {
          "~1.0.2" = {
            version = "1.0.3";
            pkg = self."range-parser-1.0.3";
          };
        };
        statuses = {
          "~1.2.1" = {
            version = "1.2.1";
            pkg = self."statuses-1.2.1";
          };
        };
      };
      meta = {
        description = "Better streaming static file server with Range and conditional-GET support";
        homepage = https://github.com/pillarjs/send;
        license = "MIT";
      };
      production = true;
      linkDependencies = false;
    };
    "destroy-1.0.3" = buildNodePackage {
      name = "destroy";
      version = "1.0.3";
      src = fetchurl {
        url = "http://registry.npmjs.org/destroy/-/destroy-1.0.3.tgz";
        sha1 = "b433b4724e71fd8551d9885174851c5fc377e2c9";
      };
      meta = {
        description = "destroy a stream if possible";
        homepage = https://github.com/stream-utils/destroy;
        license = "MIT";
      };
      production = true;
      linkDependencies = false;
    };
    "http-errors-1.3.1" = buildNodePackage {
      name = "http-errors";
      version = "1.3.1";
      src = fetchurl {
        url = "http://registry.npmjs.org/http-errors/-/http-errors-1.3.1.tgz";
        sha1 = "197e22cdebd4198585e8694ef6786197b91ed942";
      };
      dependencies = {
        inherits = {
          "~2.0.1" = {
            version = "2.0.1";
            pkg = self."inherits-2.0.1";
          };
        };
        statuses = {
          "1" = {
            version = "1.2.1";
            pkg = self."statuses-1.2.1";
          };
        };
      };
      meta = {
        description = "Create HTTP error objects";
        homepage = https://github.com/jshttp/http-errors;
        license = "MIT";
      };
      production = true;
      linkDependencies = false;
    };
    "inherits-2.0.1" = buildNodePackage {
      name = "inherits";
      version = "2.0.1";
      src = fetchurl {
        url = "http://registry.npmjs.org/inherits/-/inherits-2.0.1.tgz";
        sha1 = "b17d08d326b4423e568eff719f91b0b1cbdf69f1";
      };
      meta = {
        description = "Browser-friendly inheritance fully compatible with standard node.js inherits()";
        license = "ISC";
      };
      production = true;
      linkDependencies = false;
    };
    "inherits-~2.0.1" = self."inherits-2.0.1";
    "statuses-1.2.1" = buildNodePackage {
      name = "statuses";
      version = "1.2.1";
      src = fetchurl {
        url = "http://registry.npmjs.org/statuses/-/statuses-1.2.1.tgz";
        sha1 = "dded45cc18256d51ed40aec142489d5c61026d28";
      };
      meta = {
        description = "HTTP status utility";
        homepage = https://github.com/jshttp/statuses;
        license = "MIT";
      };
      production = true;
      linkDependencies = false;
    };
    statuses-1 = self."statuses-1.2.1";
    "http-errors-~1.3.1" = self."http-errors-1.3.1";
    "mime-1.3.4" = buildNodePackage {
      name = "mime";
      version = "1.3.4";
      src = fetchurl {
        url = "http://registry.npmjs.org/mime/-/mime-1.3.4.tgz";
        sha1 = "115f9e3b6b3daf2959983cb38f149a2d40eb5d53";
      };
      dependencies = {};
      meta = {
        description = "A comprehensive library for mime-type mapping";
        homepage = https://github.com/broofa/node-mime;
      };
      production = true;
      linkDependencies = false;
    };
    "statuses-~1.2.1" = self."statuses-1.2.1";
    "serve-static-1.10.0" = buildNodePackage {
      name = "serve-static";
      version = "1.10.0";
      src = fetchurl {
        url = "http://registry.npmjs.org/serve-static/-/serve-static-1.10.0.tgz";
        sha1 = "be632faa685820e4a43ed3df1379135cc4f370d7";
      };
      dependencies = {
        escape-html = {
          "1.0.2" = {
            version = "1.0.2";
            pkg = self."escape-html-1.0.2";
          };
        };
        parseurl = {
          "~1.3.0" = {
            version = "1.3.0";
            pkg = self."parseurl-1.3.0";
          };
        };
        send = {
          "0.13.0" = {
            version = "0.13.0";
            pkg = self."send-0.13.0";
          };
        };
      };
      meta = {
        description = "Serve static files";
        homepage = https://github.com/expressjs/serve-static;
        license = "MIT";
      };
      production = true;
      linkDependencies = false;
    };
    "serve-static-~1.10.0" = self."serve-static-1.10.0";
    "type-is-1.6.9" = buildNodePackage {
      name = "type-is";
      version = "1.6.9";
      src = fetchurl {
        url = "http://registry.npmjs.org/type-is/-/type-is-1.6.9.tgz";
        sha1 = "87f3e88b92ff5ac30fbc1acf9a9d00cbc38b3d7a";
      };
      dependencies = {
        media-typer = {
          "0.3.0" = {
            version = "0.3.0";
            pkg = self."media-typer-0.3.0";
          };
        };
        mime-types = {
          "~2.1.7" = {
            version = "2.1.7";
            pkg = self."mime-types-2.1.7";
          };
        };
      };
      meta = {
        description = "Infer the content-type of a request.";
        homepage = https://github.com/jshttp/type-is;
        license = "MIT";
      };
      production = true;
      linkDependencies = false;
    };
    "media-typer-0.3.0" = buildNodePackage {
      name = "media-typer";
      version = "0.3.0";
      src = fetchurl {
        url = "http://registry.npmjs.org/media-typer/-/media-typer-0.3.0.tgz";
        sha1 = "8710d7af0aa626f8fffa1ce00168545263255748";
      };
      meta = {
        description = "Simple RFC 6838 media type parser and formatter";
        homepage = https://github.com/jshttp/media-typer;
        license = "MIT";
      };
      production = true;
      linkDependencies = false;
    };
    "mime-types-~2.1.7" = self."mime-types-2.1.7";
    "type-is-~1.6.6" = self."type-is-1.6.9";
    "utils-merge-1.0.0" = buildNodePackage {
      name = "utils-merge";
      version = "1.0.0";
      src = fetchurl {
        url = "http://registry.npmjs.org/utils-merge/-/utils-merge-1.0.0.tgz";
        sha1 = "0294fb922bb9375153541c4f7096231f287c8af8";
      };
      dependencies = {};
      meta = {
        description = "merge() utility function";
      };
      production = true;
      linkDependencies = false;
    };
    "vary-1.0.1" = buildNodePackage {
      name = "vary";
      version = "1.0.1";
      src = fetchurl {
        url = "http://registry.npmjs.org/vary/-/vary-1.0.1.tgz";
        sha1 = "99e4981566a286118dfb2b817357df7993376d10";
      };
      meta = {
        description = "Manipulate the HTTP Vary header";
        homepage = https://github.com/jshttp/vary;
        license = "MIT";
      };
      production = true;
      linkDependencies = false;
    };
    "vary-~1.0.1" = self."vary-1.0.1";
    "express-4.x.x" = self."express-4.13.3";
    "express-validator-2.18.0" = buildNodePackage {
      name = "express-validator";
      version = "2.18.0";
      src = fetchurl {
        url = "http://registry.npmjs.org/express-validator/-/express-validator-2.18.0.tgz";
        sha1 = "d65d252b6355d7dfe935180463370d8915357dad";
      };
      dependencies = {
        bluebird = {
          "^2.9.x" = {
            version = "2.10.2";
            pkg = self."bluebird-2.10.2";
          };
        };
        lodash = {
          "3.10.x" = {
            version = "3.10.1";
            pkg = self."lodash-3.10.1";
          };
        };
        validator = {
          "4.2.x" = {
            version = "4.2.1";
            pkg = self."validator-4.2.1";
          };
        };
      };
      meta = {
        description = "Express middleware for the validator module.";
        homepage = https://github.com/ctavan/express-validator;
        license = "MIT";
      };
      production = true;
      linkDependencies = false;
    };
    "bluebird-2.10.2" = buildNodePackage {
      name = "bluebird";
      version = "2.10.2";
      src = fetchurl {
        url = "http://registry.npmjs.org/bluebird/-/bluebird-2.10.2.tgz";
        sha1 = "024a5517295308857f14f91f1106fc3b555f446b";
      };
      meta = {
        description = "Full featured Promises/A+ implementation with exceptionally good performance";
        homepage = https://github.com/petkaantonov/bluebird;
        license = "MIT";
      };
      production = true;
      linkDependencies = false;
    };
    "bluebird-^2.9.x" = self."bluebird-2.10.2";
    "lodash-3.10.1" = buildNodePackage {
      name = "lodash";
      version = "3.10.1";
      src = fetchurl {
        url = "http://registry.npmjs.org/lodash/-/lodash-3.10.1.tgz";
        sha1 = "5bf45e8e49ba4189e17d482789dfd15bd140b7b6";
      };
      meta = {
        description = "The modern build of lodash modular utilities.";
        homepage = https://lodash.com/;
        license = "MIT";
      };
      production = true;
      linkDependencies = false;
    };
    "lodash-3.10.x" = self."lodash-3.10.1";
    "validator-4.2.1" = buildNodePackage {
      name = "validator";
      version = "4.2.1";
      src = fetchurl {
        url = "http://registry.npmjs.org/validator/-/validator-4.2.1.tgz";
        sha1 = "c4a8316242e515cd784171986296f8f81fc2ab35";
      };
      meta = {
        description = "String validation and sanitization";
        homepage = http://github.com/chriso/validator.js;
        license = "MIT";
      };
      production = true;
      linkDependencies = false;
    };
    "validator-4.2.x" = self."validator-4.2.1";
    "express-validator-2.18.x" = self."express-validator-2.18.0";
    "mongodb-2.0.48" = buildNodePackage {
      name = "mongodb";
      version = "2.0.48";
      src = fetchurl {
        url = "http://registry.npmjs.org/mongodb/-/mongodb-2.0.48.tgz";
        sha1 = "f0eee445e8f2241c4b96658b8697e17ddabb9da3";
      };
      dependencies = {
        mongodb-core = {
          "1.2.21" = {
            version = "1.2.21";
            pkg = self."mongodb-core-1.2.21";
          };
        };
        readable-stream = {
          "1.0.31" = {
            version = "1.0.31";
            pkg = self."readable-stream-1.0.31";
          };
        };
        es6-promise = {
          "2.1.1" = {
            version = "2.1.1";
            pkg = self."es6-promise-2.1.1";
          };
        };
      };
      meta = {
        description = "MongoDB legacy driver emulation layer on top of mongodb-core";
        homepage = https://github.com/mongodb/node-mongodb-native;
        license = "Apache-2.0";
      };
      production = true;
      linkDependencies = false;
    };
    "mongodb-core-1.2.21" = buildNodePackage {
      name = "mongodb-core";
      version = "1.2.21";
      src = fetchurl {
        url = "http://registry.npmjs.org/mongodb-core/-/mongodb-core-1.2.21.tgz";
        sha1 = "3bcbccd31147b8cf0134c0da52675f121b1ea3fb";
      };
      dependencies = {
        bson = {
          "~0.4.19" = {
            version = "0.4.19";
            pkg = self."bson-0.4.19";
          };
        };
        kerberos = {
          "~0.0" = {
            version = "0.0.17";
            pkg = self."kerberos-0.0.17";
          };
        };
      };
      meta = {
        description = "Core MongoDB driver functionality, no bells and whistles and meant for integration not end applications";
        homepage = https://github.com/christkv/mongodb-core;
        license = "Apache-2.0";
      };
      production = true;
      linkDependencies = false;
    };
    "bson-0.4.19" = buildNodePackage {
      name = "bson";
      version = "0.4.19";
      src = fetchurl {
        url = "http://registry.npmjs.org/bson/-/bson-0.4.19.tgz";
        sha1 = "1a340f39a83d163c18af9c5ca92d2b697a35be41";
      };
      meta = {
        description = "A bson parser for node.js and the browser";
        homepage = https://github.com/mongodb/js-bson;
        license = "Apache-2.0";
      };
      production = true;
      linkDependencies = false;
    };
    "bson-~0.4.19" = self."bson-0.4.19";
    "kerberos-0.0.17" = buildNodePackage {
      name = "kerberos";
      version = "0.0.17";
      src = fetchurl {
        url = "http://registry.npmjs.org/kerberos/-/kerberos-0.0.17.tgz";
        sha1 = "29a67c0b127bfa52bdd3b53b7b8c8659a9a084f8";
      };
      dependencies = {
        nan = {
          "~2.0" = {
            version = "2.0.9";
            pkg = self."nan-2.0.9";
          };
        };
      };
      meta = {
        description = "Kerberos library for Node.js";
        homepage = https://github.com/christkv/kerberos;
        license = "Apache 2.0";
      };
      production = true;
      linkDependencies = false;
    };
    "nan-2.0.9" = buildNodePackage {
      name = "nan";
      version = "2.0.9";
      src = fetchurl {
        url = "http://registry.npmjs.org/nan/-/nan-2.0.9.tgz";
        sha1 = "d02a770f46778842cceb94e17cab31ffc7234a05";
      };
      meta = {
        description = "Native Abstractions for Node.js: C++ header for Node 0.8 -> 4 compatibility";
        homepage = "https://github.com/nodejs/nan#readme";
        license = "MIT";
      };
      production = true;
      linkDependencies = false;
    };
    "nan-~2.0" = self."nan-2.0.9";
    "kerberos-~0.0" = self."kerberos-0.0.17";
    "readable-stream-1.0.31" = buildNodePackage {
      name = "readable-stream";
      version = "1.0.31";
      src = fetchurl {
        url = "http://registry.npmjs.org/readable-stream/-/readable-stream-1.0.31.tgz";
        sha1 = "8f2502e0bc9e3b0da1b94520aabb4e2603ecafae";
      };
      dependencies = {
        core-util-is = {
          "~1.0.0" = {
            version = "1.0.1";
            pkg = self."core-util-is-1.0.1";
          };
        };
        isarray = {
          "0.0.1" = {
            version = "0.0.1";
            pkg = self."isarray-0.0.1";
          };
        };
        string_decoder = {
          "~0.10.x" = {
            version = "0.10.31";
            pkg = self."string_decoder-0.10.31";
          };
        };
        inherits = {
          "~2.0.1" = {
            version = "2.0.1";
            pkg = self."inherits-2.0.1";
          };
        };
      };
      meta = {
        description = "Streams2, a user-land copy of the stream library from Node.js v0.10.x";
        homepage = https://github.com/isaacs/readable-stream;
        license = "MIT";
      };
      production = true;
      linkDependencies = false;
    };
    "core-util-is-1.0.1" = buildNodePackage {
      name = "core-util-is";
      version = "1.0.1";
      src = fetchurl {
        url = "http://registry.npmjs.org/core-util-is/-/core-util-is-1.0.1.tgz";
        sha1 = "6b07085aef9a3ccac6ee53bf9d3df0c1521a5538";
      };
      meta = {
        description = "The `util.is*` functions introduced in Node v0.12.";
        homepage = https://github.com/isaacs/core-util-is;
        license = "MIT";
      };
      production = true;
      linkDependencies = false;
    };
    "core-util-is-~1.0.0" = self."core-util-is-1.0.1";
    "isarray-0.0.1" = buildNodePackage {
      name = "isarray";
      version = "0.0.1";
      src = fetchurl {
        url = "http://registry.npmjs.org/isarray/-/isarray-0.0.1.tgz";
        sha1 = "8a18acfca9a8f4177e09abfc6038939b05d1eedf";
      };
      dependencies = {};
      meta = {
        description = "Array#isArray for older browsers";
        homepage = https://github.com/juliangruber/isarray;
        license = "MIT";
      };
      production = true;
      linkDependencies = false;
    };
    "string_decoder-0.10.31" = buildNodePackage {
      name = "string_decoder";
      version = "0.10.31";
      src = fetchurl {
        url = "http://registry.npmjs.org/string_decoder/-/string_decoder-0.10.31.tgz";
        sha1 = "62e203bc41766c6c28c9fc84301dab1c5310fa94";
      };
      dependencies = {};
      meta = {
        description = "The string_decoder module from Node core";
        homepage = https://github.com/rvagg/string_decoder;
        license = "MIT";
      };
      production = true;
      linkDependencies = false;
    };
    "string_decoder-~0.10.x" = self."string_decoder-0.10.31";
    "es6-promise-2.1.1" = buildNodePackage {
      name = "es6-promise";
      version = "2.1.1";
      src = fetchurl {
        url = "http://registry.npmjs.org/es6-promise/-/es6-promise-2.1.1.tgz";
        sha1 = "03e8f3c7297928e5478d6ab1d0643251507bdedd";
      };
      meta = {
        description = "A lightweight library that provides tools for organizing asynchronous code";
        homepage = https://github.com/jakearchibald/ES6-Promises;
        license = "MIT";
      };
      production = true;
      linkDependencies = false;
    };
    "mongodb-~2.0" = self."mongodb-2.0.48";
    "slasp-0.0.4" = buildNodePackage {
      name = "slasp";
      version = "0.0.4";
      src = fetchurl {
        url = "http://registry.npmjs.org/slasp/-/slasp-0.0.4.tgz";
        sha1 = "9adc26ee729a0f95095851a5489f87a5258d57a9";
      };
      meta = {
        description = "SugarLess Asynchronous Structured Programming library with Object Oriented Programming Support";
        homepage = https://github.com/svanderburg/slasp;
        license = "MIT";
      };
      production = true;
      linkDependencies = false;
    };
  };
in
registry