{\rtf1\ansi\ansicpg1252\cocoartf2638
\cocoatextscaling0\cocoaplatform0{\fonttbl\f0\fnil\fcharset0 Menlo-Regular;}
{\colortbl;\red255\green255\blue255;\red79\green122\blue61;\red255\green255\blue255;\red172\green173\blue193;
\red71\green137\blue205;\red212\green212\blue212;\red167\green197\blue151;\red42\green88\blue69;\red238\green114\blue173;
\red30\green30\blue34;\red252\green180\blue12;\red194\green126\blue101;\red16\green91\blue166;}
{\*\expandedcolortbl;;\cssrgb\c37609\c54466\c30476;\cssrgb\c100000\c100000\c100000\c0;\cssrgb\c73059\c73457\c80033;
\cssrgb\c33936\c61427\c84130;\cssrgb\c86370\c86370\c86262;\cssrgb\c71008\c80807\c65805;\cssrgb\c21166\c41568\c34081;\cssrgb\c95320\c54126\c73246;
\cssrgb\c15714\c15716\c17657;\cssrgb\c99664\c75273\c2206;\cssrgb\c80778\c56830\c46925;\cssrgb\c4704\c43972\c71082;}
\margl1440\margr1440\vieww11520\viewh8400\viewkind0
\deftab720
\pard\pardeftab720\partightenfactor0

\f0\fs24 \cf2 \cb3 \expnd0\expndtw0\kerning0
\outl0\strokewidth0 \strokec2 //SPDX-License-Identifier: MIT\cf4 \strokec4 \
\
\pard\pardeftab720\partightenfactor0
\cf5 \strokec5 pragma\cf4 \strokec4  \cf5 \strokec5 solidity\cf4 \strokec4  \cf6 \strokec6 ^\cf7 \strokec7 0.8.11\cf6 \strokec6 ;\cf4 \strokec4 \
\
\cf5 \strokec5 contract\cf4 \strokec4  PurchaseAgreement \cf6 \strokec6 \{\cf4 \strokec4 \
    \cf5 \strokec5 uint\cf4 \strokec4  \cf8 \strokec8 public\cf4 \strokec4  value\cf6 \strokec6 ;\cf4 \strokec4 \
\
    \cf5 \strokec5 address\cf4 \strokec4  \cf8 \strokec8 payable\cf4 \strokec4  \cf8 \strokec8 public\cf4 \strokec4  seller\cf6 \strokec6 ;\cf4 \strokec4 \
\
    \cf5 \strokec5 address\cf4 \strokec4  \cf8 \strokec8 payable\cf4 \strokec4  \cf8 \strokec8 public\cf4 \strokec4  buyer\cf6 \strokec6 ;\cf4 \strokec4 \
\
    \cf5 \strokec5 enum\cf4 \strokec4  State \cf6 \strokec6 \{\cf4 \strokec4  Created\cf6 \strokec6 ,\cf4 \strokec4  Locked\cf6 \strokec6 ,\cf4 \strokec4  Released\cf6 \strokec6 ,\cf4 \strokec4  Inactive \cf6 \strokec6 \}\cf4 \strokec4 \
\
    State \cf8 \strokec8 public\cf4 \strokec4  state\cf6 \strokec6 ;\cf4 \strokec4 \
\
\
    \cf9 \strokec9 constructor\cf6 \strokec6 ()\cf4 \strokec4  \cf8 \strokec8 payable\cf4 \strokec4  \cf6 \strokec6 \{\cf4 \strokec4 \
        seller \cf6 \strokec6 =\cf4 \strokec4  \cf8 \strokec8 payable\cf6 \strokec6 (\cf10 \strokec10 msg\cf6 \strokec6 .\cf4 \strokec4 sender\cf6 \strokec6 );\cf4 \strokec4 \
        value \cf6 \strokec6 =\cf4 \strokec4  \cf10 \strokec10 msg\cf6 \strokec6 .\cf4 \strokec4 value \cf6 \strokec6 /\cf4 \strokec4  \cf7 \strokec7 2\cf6 \strokec6 ;\cf4 \strokec4 \
    \cf6 \strokec6 \}\cf4 \strokec4 \
 \
    \cf2 \strokec2 ///The function cannot be called at the current state.\cf4 \strokec4 \
    error InvalidState\cf6 \strokec6 ();\cf4 \strokec4 \
\
    \cf2 \strokec2 ///Only the buyer can call this function.\cf4 \strokec4 \
    error OnlyBuyer\cf6 \strokec6 ();\cf4 \strokec4 \
\
    \cf2 \strokec2 ///Only the seller can call this function.\cf4 \strokec4 \
    error OnlySeller\cf6 \strokec6 ();\cf4 \strokec4 \
\
    \
\
    \cf5 \strokec5 modifier\cf4 \strokec4  inState\cf6 \strokec6 (\cf4 \strokec4 State state_\cf6 \strokec6 )\cf4 \strokec4  \cf6 \strokec6 \{\cf4 \strokec4 \
        \cf11 \strokec11 if\cf6 \strokec6 (\cf4 \strokec4 state \cf6 \strokec6 !=\cf4 \strokec4  state_\cf6 \strokec6 )\cf4 \strokec4  \cf6 \strokec6 \{\cf4 \strokec4 \
            \cf10 \strokec10 revert\cf4 \strokec4  InvalidState\cf6 \strokec6 ();\cf4 \strokec4 \
        \cf6 \strokec6 \}\cf4 \strokec4 \
        _\cf6 \strokec6 ;\cf4 \strokec4 \
    \cf6 \strokec6 \}\cf4 \strokec4  \
\
    \cf5 \strokec5 modifier\cf4 \strokec4  onlyBuyer\cf6 \strokec6 ()\cf4 \strokec4  \cf6 \strokec6 \{\cf4 \strokec4 \
        \cf11 \strokec11 if\cf6 \strokec6 (\cf10 \strokec10 msg\cf6 \strokec6 .\cf4 \strokec4 sender \cf6 \strokec6 !=\cf4 \strokec4  buyer\cf6 \strokec6 )\cf4 \strokec4  \cf6 \strokec6 \{\cf4 \strokec4 \
            \cf10 \strokec10 revert\cf4 \strokec4  OnlyBuyer\cf6 \strokec6 ();\cf4 \strokec4 \
        \cf6 \strokec6 \}\cf4 \strokec4 \
        _\cf6 \strokec6 ;\cf4 \strokec4 \
    \cf6 \strokec6 \}\cf4 \strokec4 \
\
    \cf5 \strokec5 modifier\cf4 \strokec4  onlySeller\cf6 \strokec6 ()\cf4 \strokec4  \cf6 \strokec6 \{\cf4 \strokec4 \
        \cf11 \strokec11 if\cf6 \strokec6 (\cf10 \strokec10 msg\cf6 \strokec6 .\cf4 \strokec4 sender \cf6 \strokec6 !=\cf4 \strokec4  seller\cf6 \strokec6 )\cf4 \strokec4  \cf6 \strokec6 \{\cf4 \strokec4 \
            \cf10 \strokec10 revert\cf4 \strokec4  OnlySeller\cf6 \strokec6 ();\cf4 \strokec4 \
        \cf6 \strokec6 \}\cf4 \strokec4 \
        _\cf6 \strokec6 ;\cf4 \strokec4 \
    \cf6 \strokec6 \}\cf4 \strokec4 \
\
\
    \cf5 \strokec5 function\cf4 \strokec4  confirmPurchase\cf6 \strokec6 ()\cf4 \strokec4  \cf8 \strokec8 external\cf4 \strokec4  inState\cf6 \strokec6 (\cf4 \strokec4 State\cf6 \strokec6 .\cf4 \strokec4 Created\cf6 \strokec6 )\cf4 \strokec4  \cf8 \strokec8 payable\cf4 \strokec4  \cf6 \strokec6 \{\cf4 \strokec4 \
        \cf10 \strokec10 require\cf6 \strokec6 (\cf10 \strokec10 msg\cf6 \strokec6 .\cf4 \strokec4 value \cf6 \strokec6 ==\cf4 \strokec4  \cf7 \strokec7 2\cf4 \strokec4  \cf6 \strokec6 *\cf4 \strokec4  value\cf6 \strokec6 ,\cf4 \strokec4  \cf12 \strokec12 "You must deposit twice the purchase amount for security purposes. Upon delivery, you will receive back your deposit."\cf6 \strokec6 );\cf4 \strokec4 \
        \
        buyer \cf6 \strokec6 =\cf4 \strokec4  \cf8 \strokec8 payable\cf6 \strokec6 (\cf10 \strokec10 msg\cf6 \strokec6 .\cf4 \strokec4 sender\cf6 \strokec6 );\cf4 \strokec4 \
\
        state \cf6 \strokec6 =\cf4 \strokec4  State\cf6 \strokec6 .\cf4 \strokec4 Locked\cf6 \strokec6 ;\cf4 \strokec4 \
    \cf6 \strokec6 \}\cf4 \strokec4 \
\
    \cf5 \strokec5 function\cf4 \strokec4  confirmReceived\cf6 \strokec6 ()\cf4 \strokec4  \cf8 \strokec8 external\cf4 \strokec4  onlyBuyer inState\cf6 \strokec6 (\cf4 \strokec4 State\cf6 \strokec6 .\cf4 \strokec4 Locked\cf6 \strokec6 )\cf4 \strokec4  \cf6 \strokec6 \{\cf4 \strokec4 \
        state \cf6 \strokec6 =\cf4 \strokec4  State\cf6 \strokec6 .\cf4 \strokec4 Released\cf6 \strokec6 ;\cf4 \strokec4 \
\
        buyer\cf6 \strokec6 .\cf4 \strokec4 transfer\cf6 \strokec6 (\cf4 \strokec4 value\cf6 \strokec6 );\cf4 \strokec4 \
    \cf6 \strokec6 \}\cf4 \strokec4 \
\
    \cf5 \strokec5 function\cf4 \strokec4  paySeller\cf6 \strokec6 ()\cf4 \strokec4  \cf8 \strokec8 external\cf4 \strokec4  onlySeller inState\cf6 \strokec6 (\cf4 \strokec4 State\cf6 \strokec6 .\cf4 \strokec4 Released\cf6 \strokec6 )\cf4 \strokec4  \cf6 \strokec6 \{\cf4 \strokec4 \
        state \cf6 \strokec6 =\cf4 \strokec4  State\cf6 \strokec6 .\cf4 \strokec4 Inactive\cf6 \strokec6 ;\cf4 \strokec4 \
\
        seller\cf6 \strokec6 .\cf4 \strokec4 transfer\cf6 \strokec6 (\cf7 \strokec7 3\cf4 \strokec4  \cf6 \strokec6 *\cf4 \strokec4  value\cf6 \strokec6 );\cf4 \strokec4 \
    \cf6 \strokec6 \}\cf4 \strokec4 \
\
    \cf5 \strokec5 function\cf4 \strokec4  abort\cf6 \strokec6 ()\cf4 \strokec4  \cf8 \strokec8 external\cf4 \strokec4  onlySeller inState\cf6 \strokec6 (\cf4 \strokec4 State\cf6 \strokec6 .\cf4 \strokec4 Created\cf6 \strokec6 )\cf4 \strokec4  \cf6 \strokec6 \{\cf4 \strokec4 \
        state \cf6 \strokec6 =\cf4 \strokec4  State\cf6 \strokec6 .\cf4 \strokec4 Inactive\cf6 \strokec6 ;\cf4 \strokec4 \
\
        seller\cf6 \strokec6 .\cf4 \strokec4 transfer\cf6 \strokec6 (\cf5 \strokec5 address\cf6 \strokec6 (\cf13 \strokec13 this\cf6 \strokec6 ).\cf4 \strokec4 balance\cf6 \strokec6 );\cf4 \strokec4 \
    \cf6 \strokec6 \}\cf4 \strokec4 \
\
\
\
\pard\pardeftab720\partightenfactor0
\cf6 \strokec6 \}\cf4 \strokec4 \
}