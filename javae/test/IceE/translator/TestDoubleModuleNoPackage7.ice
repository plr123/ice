// **********************************************************************
//
// Copyright (c) 2003-2006 ZeroC, Inc. All rights reserved.
//
// This copy of Ice-E is licensed to you under the terms described in the
// ICEE_LICENSE file included in this distribution.
//
// **********************************************************************

// Test: use DoubleModuleNoPackage types from (same) double module with package definitions

#include <DoubleModuleNoPackage.ice>

[["java:package:dmnpTest7"]]

module M1
{
module M2
{

const dmnpEnum dmnpTest7Constant = dmnpE1;

struct dmnpTest7Struct
{
    dmnpEnum e;
    dmnpStruct s;
    dmnpStructSeq seq;
    dmnpStringStructDict dict;
};

sequence<dmnpStruct> dmnpTest7StructSeq;

interface dmnpTest7Interface extends dmnpInterface {};

exception dmnpTest7Exception extends dmnpException
{
    dmnpEnum e1;
    dmnpStruct s1;
    dmnpStructSeq seq1;
    dmnpStringStructDict dict1;
};

class dmnpTest7Class extends dmnpBaseClass implements dmnpBaseInterface
{
    dmnpStruct
    dmnpTest7Op1(dmnpEnum i1,
                 dmnpStruct i2,
                 dmnpStructSeq i3,
                 dmnpStringStructDict i4,
                 out dmnpEnum o1,
                 out dmnpStruct o2,
                 out dmnpStructSeq o3,
                 out dmnpStringStructDict o4)
        throws dmnpException;

    ["ami"]
    dmnpStruct
    dmnpTest7Op2(dmnpEnum i1,
                 dmnpStruct i2,
                 dmnpStructSeq i3,
                 dmnpStringStructDict i4,
                 out dmnpEnum o1,
                 out dmnpStruct o2,
                 out dmnpStructSeq o3,
                 out dmnpStringStructDict o4)
        throws dmnpException;

    ["amd"]
    dmnpStruct
    dmnpTest7Op3(dmnpEnum i1,
                 dmnpStruct i2,
                 dmnpStructSeq i3,
                 dmnpStringStructDict i4,
                 out dmnpEnum o1,
                 out dmnpStruct o2,
                 out dmnpStructSeq o3,
                 out dmnpStringStructDict o4)
        throws dmnpException;
};

};
};
