{nodeEnv, fetchurl, fetchgit}:

let
  sources = {
    "express-4.13.4" = {
      name = "express";
      packageName = "express";
      version = "4.13.4";
      src = fetchurl {
        url = "http://registry.npmjs.org/express/-/express-4.13.4.tgz";
        sha1 = "3c0b76f3c77590c8345739061ec0bd3ba067ec24";
      };
    };
    "express-validator-2.18.0" = {
      name = "express-validator";
      packageName = "express-validator";
      version = "2.18.0";
      src = fetchurl {
        url = "http://registry.npmjs.org/express-validator/-/express-validator-2.18.0.tgz";
        sha1 = "d65d252b6355d7dfe935180463370d8915357dad";
      };
    };
    "mongodb-2.0.55" = {
      name = "mongodb";
      packageName = "mongodb";
      version = "2.0.55";
      src = fetchurl {
        url = "http://registry.npmjs.org/mongodb/-/mongodb-2.0.55.tgz";
        sha1 = "a09dd77259f6bba69f7dd592a011c11aa5761097";
      };
    };
    "slasp-0.0.4" = {
      name = "slasp";
      packageName = "slasp";
      version = "0.0.4";
      src = fetchurl {
        url = "http://registry.npmjs.org/slasp/-/slasp-0.0.4.tgz";
        sha1 = "9adc26ee729a0f95095851a5489f87a5258d57a9";
      };
    };
    "body-parser-1.13.3" = {
      name = "body-parser";
      packageName = "body-parser";
      version = "1.13.3";
      src = fetchurl {
        url = "http://registry.npmjs.org/body-parser/-/body-parser-1.13.3.tgz";
        sha1 = "c08cf330c3358e151016a05746f13f029c97fa97";
      };
    };
    "accepts-1.2.13" = {
      name = "accepts";
      packageName = "accepts";
      version = "1.2.13";
      src = fetchurl {
        url = "http://registry.npmjs.org/accepts/-/accepts-1.2.13.tgz";
        sha1 = "e5f1f3928c6d95fd96558c36ec3d9d0de4a6ecea";
      };
    };
    "array-flatten-1.1.1" = {
      name = "array-flatten";
      packageName = "array-flatten";
      version = "1.1.1";
      src = fetchurl {
        url = "http://registry.npmjs.org/array-flatten/-/array-flatten-1.1.1.tgz";
        sha1 = "9a5f699051b1e7073328f2a008968b64ea2955d2";
      };
    };
    "content-disposition-0.5.1" = {
      name = "content-disposition";
      packageName = "content-disposition";
      version = "0.5.1";
      src = fetchurl {
        url = "http://registry.npmjs.org/content-disposition/-/content-disposition-0.5.1.tgz";
        sha1 = "87476c6a67c8daa87e32e87616df883ba7fb071b";
      };
    };
    "content-type-1.0.1" = {
      name = "content-type";
      packageName = "content-type";
      version = "1.0.1";
      src = fetchurl {
        url = "http://registry.npmjs.org/content-type/-/content-type-1.0.1.tgz";
        sha1 = "a19d2247327dc038050ce622b7a154ec59c5e600";
      };
    };
    "cookie-0.1.5" = {
      name = "cookie";
      packageName = "cookie";
      version = "0.1.5";
      src = fetchurl {
        url = "http://registry.npmjs.org/cookie/-/cookie-0.1.5.tgz";
        sha1 = "6ab9948a4b1ae21952cd2588530a4722d4044d7c";
      };
    };
    "cookie-signature-1.0.6" = {
      name = "cookie-signature";
      packageName = "cookie-signature";
      version = "1.0.6";
      src = fetchurl {
        url = "http://registry.npmjs.org/cookie-signature/-/cookie-signature-1.0.6.tgz";
        sha1 = "e303a882b342cc3ee8ca513a79999734dab3ae2c";
      };
    };
    "debug-2.2.0" = {
      name = "debug";
      packageName = "debug";
      version = "2.2.0";
      src = fetchurl {
        url = "http://registry.npmjs.org/debug/-/debug-2.2.0.tgz";
        sha1 = "f87057e995b1a1f6ae6a4960664137bc56f039da";
      };
    };
    "depd-1.1.0" = {
      name = "depd";
      packageName = "depd";
      version = "1.1.0";
      src = fetchurl {
        url = "http://registry.npmjs.org/depd/-/depd-1.1.0.tgz";
        sha1 = "e1bd82c6aab6ced965b97b88b17ed3e528ca18c3";
      };
    };
    "escape-html-1.0.3" = {
      name = "escape-html";
      packageName = "escape-html";
      version = "1.0.3";
      src = fetchurl {
        url = "http://registry.npmjs.org/escape-html/-/escape-html-1.0.3.tgz";
        sha1 = "0258eae4d3d0c0974de1c169188ef0051d1d1988";
      };
    };
    "etag-1.7.0" = {
      name = "etag";
      packageName = "etag";
      version = "1.7.0";
      src = fetchurl {
        url = "http://registry.npmjs.org/etag/-/etag-1.7.0.tgz";
        sha1 = "03d30b5f67dd6e632d2945d30d6652731a34d5d8";
      };
    };
    "finalhandler-0.4.1" = {
      name = "finalhandler";
      packageName = "finalhandler";
      version = "0.4.1";
      src = fetchurl {
        url = "http://registry.npmjs.org/finalhandler/-/finalhandler-0.4.1.tgz";
        sha1 = "85a17c6c59a94717d262d61230d4b0ebe3d4a14d";
      };
    };
    "fresh-0.3.0" = {
      name = "fresh";
      packageName = "fresh";
      version = "0.3.0";
      src = fetchurl {
        url = "http://registry.npmjs.org/fresh/-/fresh-0.3.0.tgz";
        sha1 = "651f838e22424e7566de161d8358caa199f83d4f";
      };
    };
    "merge-descriptors-1.0.1" = {
      name = "merge-descriptors";
      packageName = "merge-descriptors";
      version = "1.0.1";
      src = fetchurl {
        url = "http://registry.npmjs.org/merge-descriptors/-/merge-descriptors-1.0.1.tgz";
        sha1 = "b00aaa556dd8b44568150ec9d1b953f3f90cbb61";
      };
    };
    "methods-1.1.2" = {
      name = "methods";
      packageName = "methods";
      version = "1.1.2";
      src = fetchurl {
        url = "http://registry.npmjs.org/methods/-/methods-1.1.2.tgz";
        sha1 = "5529a4d67654134edcc5266656835b0f851afcee";
      };
    };
    "on-finished-2.3.0" = {
      name = "on-finished";
      packageName = "on-finished";
      version = "2.3.0";
      src = fetchurl {
        url = "http://registry.npmjs.org/on-finished/-/on-finished-2.3.0.tgz";
        sha1 = "20f1336481b083cd75337992a16971aa2d906947";
      };
    };
    "parseurl-1.3.1" = {
      name = "parseurl";
      packageName = "parseurl";
      version = "1.3.1";
      src = fetchurl {
        url = "http://registry.npmjs.org/parseurl/-/parseurl-1.3.1.tgz";
        sha1 = "c8ab8c9223ba34888aa64a297b28853bec18da56";
      };
    };
    "path-to-regexp-0.1.7" = {
      name = "path-to-regexp";
      packageName = "path-to-regexp";
      version = "0.1.7";
      src = fetchurl {
        url = "http://registry.npmjs.org/path-to-regexp/-/path-to-regexp-0.1.7.tgz";
        sha1 = "df604178005f522f15eb4490e7247a1bfaa67f8c";
      };
    };
    "proxy-addr-1.0.10" = {
      name = "proxy-addr";
      packageName = "proxy-addr";
      version = "1.0.10";
      src = fetchurl {
        url = "http://registry.npmjs.org/proxy-addr/-/proxy-addr-1.0.10.tgz";
        sha1 = "0d40a82f801fc355567d2ecb65efe3f077f121c5";
      };
    };
    "qs-4.0.0" = {
      name = "qs";
      packageName = "qs";
      version = "4.0.0";
      src = fetchurl {
        url = "http://registry.npmjs.org/qs/-/qs-4.0.0.tgz";
        sha1 = "c31d9b74ec27df75e543a86c78728ed8d4623607";
      };
    };
    "range-parser-1.0.3" = {
      name = "range-parser";
      packageName = "range-parser";
      version = "1.0.3";
      src = fetchurl {
        url = "http://registry.npmjs.org/range-parser/-/range-parser-1.0.3.tgz";
        sha1 = "6872823535c692e2c2a0103826afd82c2e0ff175";
      };
    };
    "send-0.13.1" = {
      name = "send";
      packageName = "send";
      version = "0.13.1";
      src = fetchurl {
        url = "http://registry.npmjs.org/send/-/send-0.13.1.tgz";
        sha1 = "a30d5f4c82c8a9bae9ad00a1d9b1bdbe6f199ed7";
      };
    };
    "serve-static-1.10.2" = {
      name = "serve-static";
      packageName = "serve-static";
      version = "1.10.2";
      src = fetchurl {
        url = "http://registry.npmjs.org/serve-static/-/serve-static-1.10.2.tgz";
        sha1 = "feb800d0e722124dd0b00333160c16e9caa8bcb3";
      };
    };
    "type-is-1.6.11" = {
      name = "type-is";
      packageName = "type-is";
      version = "1.6.11";
      src = fetchurl {
        url = "http://registry.npmjs.org/type-is/-/type-is-1.6.11.tgz";
        sha1 = "42ecde7970f2363738b986c0351efba5aa531648";
      };
    };
    "utils-merge-1.0.0" = {
      name = "utils-merge";
      packageName = "utils-merge";
      version = "1.0.0";
      src = fetchurl {
        url = "http://registry.npmjs.org/utils-merge/-/utils-merge-1.0.0.tgz";
        sha1 = "0294fb922bb9375153541c4f7096231f287c8af8";
      };
    };
    "vary-1.0.1" = {
      name = "vary";
      packageName = "vary";
      version = "1.0.1";
      src = fetchurl {
        url = "http://registry.npmjs.org/vary/-/vary-1.0.1.tgz";
        sha1 = "99e4981566a286118dfb2b817357df7993376d10";
      };
    };
    "mime-types-2.1.10" = {
      name = "mime-types";
      packageName = "mime-types";
      version = "2.1.10";
      src = fetchurl {
        url = "http://registry.npmjs.org/mime-types/-/mime-types-2.1.10.tgz";
        sha1 = "b93c7cb4362e16d41072a7e54538fb4d43070837";
      };
    };
    "negotiator-0.5.3" = {
      name = "negotiator";
      packageName = "negotiator";
      version = "0.5.3";
      src = fetchurl {
        url = "http://registry.npmjs.org/negotiator/-/negotiator-0.5.3.tgz";
        sha1 = "269d5c476810ec92edbe7b6c2f28316384f9a7e8";
      };
    };
    "mime-db-1.22.0" = {
      name = "mime-db";
      packageName = "mime-db";
      version = "1.22.0";
      src = fetchurl {
        url = "http://registry.npmjs.org/mime-db/-/mime-db-1.22.0.tgz";
        sha1 = "ab23a6372dc9d86d3dc9121bd0ebd38105a1904a";
      };
    };
    "ms-0.7.1" = {
      name = "ms";
      packageName = "ms";
      version = "0.7.1";
      src = fetchurl {
        url = "http://registry.npmjs.org/ms/-/ms-0.7.1.tgz";
        sha1 = "9cd13c03adbff25b65effde7ce864ee952017098";
      };
    };
    "unpipe-1.0.0" = {
      name = "unpipe";
      packageName = "unpipe";
      version = "1.0.0";
      src = fetchurl {
        url = "http://registry.npmjs.org/unpipe/-/unpipe-1.0.0.tgz";
        sha1 = "b2bf4ee8514aae6165b4817829d21b2ef49904ec";
      };
    };
    "ee-first-1.1.1" = {
      name = "ee-first";
      packageName = "ee-first";
      version = "1.1.1";
      src = fetchurl {
        url = "http://registry.npmjs.org/ee-first/-/ee-first-1.1.1.tgz";
        sha1 = "590c61156b0ae2f4f0255732a158b266bc56b21d";
      };
    };
    "forwarded-0.1.0" = {
      name = "forwarded";
      packageName = "forwarded";
      version = "0.1.0";
      src = fetchurl {
        url = "http://registry.npmjs.org/forwarded/-/forwarded-0.1.0.tgz";
        sha1 = "19ef9874c4ae1c297bcf078fde63a09b66a84363";
      };
    };
    "ipaddr.js-1.0.5" = {
      name = "ipaddr.js";
      packageName = "ipaddr.js";
      version = "1.0.5";
      src = fetchurl {
        url = "http://registry.npmjs.org/ipaddr.js/-/ipaddr.js-1.0.5.tgz";
        sha1 = "5fa78cf301b825c78abc3042d812723049ea23c7";
      };
    };
    "destroy-1.0.4" = {
      name = "destroy";
      packageName = "destroy";
      version = "1.0.4";
      src = fetchurl {
        url = "http://registry.npmjs.org/destroy/-/destroy-1.0.4.tgz";
        sha1 = "978857442c44749e4206613e37946205826abd80";
      };
    };
    "http-errors-1.3.1" = {
      name = "http-errors";
      packageName = "http-errors";
      version = "1.3.1";
      src = fetchurl {
        url = "http://registry.npmjs.org/http-errors/-/http-errors-1.3.1.tgz";
        sha1 = "197e22cdebd4198585e8694ef6786197b91ed942";
      };
    };
    "mime-1.3.4" = {
      name = "mime";
      packageName = "mime";
      version = "1.3.4";
      src = fetchurl {
        url = "http://registry.npmjs.org/mime/-/mime-1.3.4.tgz";
        sha1 = "115f9e3b6b3daf2959983cb38f149a2d40eb5d53";
      };
    };
    "statuses-1.2.1" = {
      name = "statuses";
      packageName = "statuses";
      version = "1.2.1";
      src = fetchurl {
        url = "http://registry.npmjs.org/statuses/-/statuses-1.2.1.tgz";
        sha1 = "dded45cc18256d51ed40aec142489d5c61026d28";
      };
    };
    "inherits-2.0.1" = {
      name = "inherits";
      packageName = "inherits";
      version = "2.0.1";
      src = fetchurl {
        url = "http://registry.npmjs.org/inherits/-/inherits-2.0.1.tgz";
        sha1 = "b17d08d326b4423e568eff719f91b0b1cbdf69f1";
      };
    };
    "media-typer-0.3.0" = {
      name = "media-typer";
      packageName = "media-typer";
      version = "0.3.0";
      src = fetchurl {
        url = "http://registry.npmjs.org/media-typer/-/media-typer-0.3.0.tgz";
        sha1 = "8710d7af0aa626f8fffa1ce00168545263255748";
      };
    };
    "bluebird-2.10.2" = {
      name = "bluebird";
      packageName = "bluebird";
      version = "2.10.2";
      src = fetchurl {
        url = "http://registry.npmjs.org/bluebird/-/bluebird-2.10.2.tgz";
        sha1 = "024a5517295308857f14f91f1106fc3b555f446b";
      };
    };
    "lodash-3.10.1" = {
      name = "lodash";
      packageName = "lodash";
      version = "3.10.1";
      src = fetchurl {
        url = "http://registry.npmjs.org/lodash/-/lodash-3.10.1.tgz";
        sha1 = "5bf45e8e49ba4189e17d482789dfd15bd140b7b6";
      };
    };
    "validator-4.2.1" = {
      name = "validator";
      packageName = "validator";
      version = "4.2.1";
      src = fetchurl {
        url = "http://registry.npmjs.org/validator/-/validator-4.2.1.tgz";
        sha1 = "c4a8316242e515cd784171986296f8f81fc2ab35";
      };
    };
    "mongodb-core-1.2.31" = {
      name = "mongodb-core";
      packageName = "mongodb-core";
      version = "1.2.31";
      src = fetchurl {
        url = "http://registry.npmjs.org/mongodb-core/-/mongodb-core-1.2.31.tgz";
        sha1 = "f1e6405f03d40846fdb838a702507affa3cb2c39";
      };
    };
    "readable-stream-1.0.31" = {
      name = "readable-stream";
      packageName = "readable-stream";
      version = "1.0.31";
      src = fetchurl {
        url = "http://registry.npmjs.org/readable-stream/-/readable-stream-1.0.31.tgz";
        sha1 = "8f2502e0bc9e3b0da1b94520aabb4e2603ecafae";
      };
    };
    "es6-promise-2.1.1" = {
      name = "es6-promise";
      packageName = "es6-promise";
      version = "2.1.1";
      src = fetchurl {
        url = "http://registry.npmjs.org/es6-promise/-/es6-promise-2.1.1.tgz";
        sha1 = "03e8f3c7297928e5478d6ab1d0643251507bdedd";
      };
    };
    "bson-0.4.21" = {
      name = "bson";
      packageName = "bson";
      version = "0.4.21";
      src = fetchurl {
        url = "http://registry.npmjs.org/bson/-/bson-0.4.21.tgz";
        sha1 = "b8eae38c5aa94f7b8e64e8cfed0f42e58308ed95";
      };
    };
    "core-util-is-1.0.2" = {
      name = "core-util-is";
      packageName = "core-util-is";
      version = "1.0.2";
      src = fetchurl {
        url = "http://registry.npmjs.org/core-util-is/-/core-util-is-1.0.2.tgz";
        sha1 = "b5fd54220aa2bc5ab57aab7140c940754503c1a7";
      };
    };
    "isarray-0.0.1" = {
      name = "isarray";
      packageName = "isarray";
      version = "0.0.1";
      src = fetchurl {
        url = "http://registry.npmjs.org/isarray/-/isarray-0.0.1.tgz";
        sha1 = "8a18acfca9a8f4177e09abfc6038939b05d1eedf";
      };
    };
    "string_decoder-0.10.31" = {
      name = "string_decoder";
      packageName = "string_decoder";
      version = "0.10.31";
      src = fetchurl {
        url = "http://registry.npmjs.org/string_decoder/-/string_decoder-0.10.31.tgz";
        sha1 = "62e203bc41766c6c28c9fc84301dab1c5310fa94";
      };
    };
    "bytes-2.1.0" = {
      name = "bytes";
      packageName = "bytes";
      version = "2.1.0";
      src = fetchurl {
        url = "http://registry.npmjs.org/bytes/-/bytes-2.1.0.tgz";
        sha1 = "ac93c410e2ffc9cc7cf4b464b38289067f5e47b4";
      };
    };
    "depd-1.0.1" = {
      name = "depd";
      packageName = "depd";
      version = "1.0.1";
      src = fetchurl {
        url = "http://registry.npmjs.org/depd/-/depd-1.0.1.tgz";
        sha1 = "80aec64c9d6d97e65cc2a9caa93c0aa6abf73aaa";
      };
    };
    "iconv-lite-0.4.11" = {
      name = "iconv-lite";
      packageName = "iconv-lite";
      version = "0.4.11";
      src = fetchurl {
        url = "http://registry.npmjs.org/iconv-lite/-/iconv-lite-0.4.11.tgz";
        sha1 = "2ecb42fd294744922209a2e7c404dac8793d8ade";
      };
    };
    "raw-body-2.1.5" = {
      name = "raw-body";
      packageName = "raw-body";
      version = "2.1.5";
      src = fetchurl {
        url = "http://registry.npmjs.org/raw-body/-/raw-body-2.1.5.tgz";
        sha1 = "8be8f09ddefd0d72ad99d883ab7f0cc350420956";
      };
    };
    "bytes-2.2.0" = {
      name = "bytes";
      packageName = "bytes";
      version = "2.2.0";
      src = fetchurl {
        url = "http://registry.npmjs.org/bytes/-/bytes-2.2.0.tgz";
        sha1 = "fd35464a403f6f9117c2de3609ecff9cae000588";
      };
    };
    "iconv-lite-0.4.13" = {
      name = "iconv-lite";
      packageName = "iconv-lite";
      version = "0.4.13";
      src = fetchurl {
        url = "http://registry.npmjs.org/iconv-lite/-/iconv-lite-0.4.13.tgz";
        sha1 = "1f88aba4ab0b1508e8312acc39345f36e992e2f2";
      };
    };
  };
  args = {
    name = "staffservice";
    packageName = "staffservice";
    version = "0.0.1";
    src = ./.;
    dependencies = [
      (sources."express-4.13.4" // {
        dependencies = [
          (sources."accepts-1.2.13" // {
            dependencies = [
              (sources."mime-types-2.1.10" // {
                dependencies = [
                  sources."mime-db-1.22.0"
                ];
              })
              sources."negotiator-0.5.3"
            ];
          })
          sources."array-flatten-1.1.1"
          sources."content-disposition-0.5.1"
          sources."content-type-1.0.1"
          sources."cookie-0.1.5"
          sources."cookie-signature-1.0.6"
          (sources."debug-2.2.0" // {
            dependencies = [
              sources."ms-0.7.1"
            ];
          })
          sources."depd-1.1.0"
          sources."escape-html-1.0.3"
          sources."etag-1.7.0"
          (sources."finalhandler-0.4.1" // {
            dependencies = [
              sources."unpipe-1.0.0"
            ];
          })
          sources."fresh-0.3.0"
          sources."merge-descriptors-1.0.1"
          sources."methods-1.1.2"
          (sources."on-finished-2.3.0" // {
            dependencies = [
              sources."ee-first-1.1.1"
            ];
          })
          sources."parseurl-1.3.1"
          sources."path-to-regexp-0.1.7"
          (sources."proxy-addr-1.0.10" // {
            dependencies = [
              sources."forwarded-0.1.0"
              sources."ipaddr.js-1.0.5"
            ];
          })
          sources."qs-4.0.0"
          sources."range-parser-1.0.3"
          (sources."send-0.13.1" // {
            dependencies = [
              sources."destroy-1.0.4"
              (sources."http-errors-1.3.1" // {
                dependencies = [
                  sources."inherits-2.0.1"
                ];
              })
              sources."mime-1.3.4"
              sources."ms-0.7.1"
              sources."statuses-1.2.1"
            ];
          })
          sources."serve-static-1.10.2"
          (sources."type-is-1.6.11" // {
            dependencies = [
              sources."media-typer-0.3.0"
              (sources."mime-types-2.1.10" // {
                dependencies = [
                  sources."mime-db-1.22.0"
                ];
              })
            ];
          })
          sources."utils-merge-1.0.0"
          sources."vary-1.0.1"
        ];
      })
      (sources."express-validator-2.18.0" // {
        dependencies = [
          sources."bluebird-2.10.2"
          sources."lodash-3.10.1"
          sources."validator-4.2.1"
        ];
      })
      (sources."mongodb-2.0.55" // {
        dependencies = [
          (sources."mongodb-core-1.2.31" // {
            dependencies = [
              sources."bson-0.4.21"
            ];
          })
          (sources."readable-stream-1.0.31" // {
            dependencies = [
              sources."core-util-is-1.0.2"
              sources."isarray-0.0.1"
              sources."string_decoder-0.10.31"
              sources."inherits-2.0.1"
            ];
          })
          sources."es6-promise-2.1.1"
        ];
      })
      sources."slasp-0.0.4"
      (sources."body-parser-1.13.3" // {
        dependencies = [
          sources."bytes-2.1.0"
          sources."content-type-1.0.1"
          (sources."debug-2.2.0" // {
            dependencies = [
              sources."ms-0.7.1"
            ];
          })
          sources."depd-1.0.1"
          (sources."http-errors-1.3.1" // {
            dependencies = [
              sources."inherits-2.0.1"
              sources."statuses-1.2.1"
            ];
          })
          sources."iconv-lite-0.4.11"
          (sources."on-finished-2.3.0" // {
            dependencies = [
              sources."ee-first-1.1.1"
            ];
          })
          sources."qs-4.0.0"
          (sources."raw-body-2.1.5" // {
            dependencies = [
              sources."bytes-2.2.0"
              sources."iconv-lite-0.4.13"
              sources."unpipe-1.0.0"
            ];
          })
          (sources."type-is-1.6.11" // {
            dependencies = [
              sources."media-typer-0.3.0"
              (sources."mime-types-2.1.10" // {
                dependencies = [
                  sources."mime-db-1.22.0"
                ];
              })
            ];
          })
        ];
      })
    ];
    meta = {
      description = "REST API interface providing access to the staff data set";
      license = "MIT";
    };
    production = true;
  };
in
{
  tarball = nodeEnv.buildNodeSourceDist args;
  package = nodeEnv.buildNodePackage args;
  shell = nodeEnv.buildNodeShell args;
}