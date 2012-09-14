// **********************************************************************
//
// Copyright (c) 2003-2012 ZeroC, Inc. All rights reserved.
//
// This copy of Ice is licensed to you under the terms described in the
// ICE_LICENSE file included in this distribution.
//
// **********************************************************************

#pragma once

[["java:package:test.Ice.optional"]]
module Test
{

class OneOptional
{
    optional(1) int a;
};

enum MyEnum
{
    MyEnumMember
};

struct SmallStruct
{
    byte m;
};

struct FixedStruct
{
    int m;
};

struct VarStruct
{
    string m;
};

struct ClassVarStruct
{
    int a;
};

sequence<byte> ByteSeq;
sequence<bool> BoolSeq;
sequence<short> ShortSeq;
sequence<int> IntSeq;
sequence<long> LongSeq;
sequence<float> FloatSeq;
sequence<double> DoubleSeq;
sequence<string> StringSeq;
sequence<MyEnum> MyEnumSeq;
sequence<SmallStruct> SmallStructSeq;
["java:type:java.util.ArrayList<SmallStruct>"] sequence<SmallStruct> SmallStructList;
sequence<FixedStruct> FixedStructSeq;
["java:type:java.util.ArrayList<FixedStruct>"] sequence<FixedStruct> FixedStructList;
sequence<VarStruct> VarStructSeq;
sequence<OneOptional> OneOptionalSeq;
sequence<OneOptional*> OneOptionalPrxSeq;

["java:serializable:test.Ice.optional.SerializableClass"] sequence<byte> Serializable;

dictionary<int, int> IntIntDict;
dictionary<string, int> StringIntDict;
dictionary<int, MyEnum> IntEnumDict;
dictionary<int, FixedStruct> IntFixedStructDict;
dictionary<int, VarStruct> IntVarStructDict;
dictionary<int, OneOptional> IntOneOptionalDict;
dictionary<int, OneOptional*> IntOneOptionalPrxDict;

class MultiOptional
{
    optional(1) byte a;
    optional(2) bool b;
    optional(3) short c;
    optional(4) int d;
    optional(5) long e;
    optional(6) float f;
    optional(7) double g;
    optional(8) string h;
    optional(9) MyEnum i;
    optional(10) MultiOptional* j;
    optional(11) MultiOptional k;
    optional(12) ByteSeq bs;
    optional(13) StringSeq ss;
    optional(14) IntIntDict iid;
    optional(15) StringIntDict sid;
    optional(16) FixedStruct fs;
    optional(17) VarStruct vs;

    optional(18) ShortSeq shs;
    optional(19) MyEnumSeq es;
    optional(20) FixedStructSeq fss;
    optional(21) VarStructSeq vss;
    optional(22) OneOptionalSeq oos;
    optional(23) OneOptionalPrxSeq oops;

    optional(24) IntEnumDict ied;
    optional(25) IntFixedStructDict ifsd;
    optional(26) IntVarStructDict ivsd;
    optional(27) IntOneOptionalDict iood;
    optional(28) IntOneOptionalPrxDict ioopd;

    optional(29) BoolSeq bos;
};

class A
{
    int requiredA;
    optional(1) int ma;
    optional(50) int mb;
    optional(500) int mc;
};

["preserve-slice"]
class B extends A
{
    int requiredB;
    optional(10) int md;
};

class C extends B
{
    string ss;
    optional(890) string ms;
};

class WD
{
    optional(1) int a = 5;
    optional(2) string s = "test";
};

exception OptionalException
{
    optional(1) int a = 5;
    optional(2) string b;
    optional(50) OneOptional o;
};

exception DerivedException extends OptionalException
{
    optional(600) string ss = "test";
    optional(601) OneOptional o2;
};

exception RequiredException extends OptionalException
{
    string ss = "test";
    OneOptional o2;
};

class OptionalWithCustom
{
    ["java:type:java.util.ArrayList<Byte>"] optional(1) ByteSeq bs;
    optional(2) ClassVarStruct s;
};

["ami"]
class Initial
{
    void shutdown();

    Object pingPong(Object o);

    ["java:optional"]
    void opOptionalException(optional(1) int a, optional(2) string b, optional(3) OneOptional o)
        throws OptionalException;

    optional(1) byte opByte(optional(2) byte p1, out optional(3) byte p3);
    ["java:optional"] optional(1) byte opByteOpt(optional(2) byte p1, out optional(3) byte p3);

    optional(1) bool opBool(optional(2) bool p1, out optional(3) bool p3);
    ["java:optional"] optional(1) bool opBoolOpt(optional(2) bool p1, out optional(3) bool p3);

    optional(1) short opShort(optional(2) short p1, out optional(3) short p3);
    ["java:optional"] optional(1) short opShortOpt(optional(2) short p1, out optional(3) short p3);

    optional(1) int opInt(optional(2) int p1, out optional(3) int p3);
    ["java:optional"] optional(1) int opIntOpt(optional(2) int p1, out optional(3) int p3);

    optional(3) long opLong(optional(1) long p1, out optional(2) long p3);
    ["java:optional"] optional(3) long opLongOpt(optional(1) long p1, out optional(2) long p3);

    optional(1) float opFloat(optional(2) float p1, out optional(3) float p3);
    ["java:optional"] optional(1) float opFloatOpt(optional(2) float p1, out optional(3) float p3);

    optional(1) double opDouble(optional(2) double p1, out optional(3) double p3);
    ["java:optional"] optional(1) double opDoubleOpt(optional(2) double p1, out optional(3) double p3);

    optional(1) string opString(optional(2) string p1, out optional(3) string p3);
    ["java:optional"] optional(1) string opStringOpt(optional(2) string p1, out optional(3) string p3);

    optional(1) MyEnum opMyEnum(optional(2) MyEnum p1, out optional(3) MyEnum p3);
    ["java:optional"] optional(1) MyEnum opMyEnumOpt(optional(2) MyEnum p1, out optional(3) MyEnum p3);

    optional(1) SmallStruct opSmallStruct(optional(2) SmallStruct p1, out optional(3) SmallStruct p3);
    ["java:optional"] optional(1) SmallStruct opSmallStructOpt(optional(2) SmallStruct p1,
                                                               out optional(3) SmallStruct p3);

    optional(1) FixedStruct opFixedStruct(optional(2) FixedStruct p1, out optional(3) FixedStruct p3);
    ["java:optional"] optional(1) FixedStruct opFixedStructOpt(optional(2) FixedStruct p1,
                                                               out optional(3) FixedStruct p3);

    optional(1) VarStruct opVarStruct(optional(2) VarStruct p1, out optional(3) VarStruct p3);
    ["java:optional"] optional(1) VarStruct opVarStructOpt(optional(2) VarStruct p1, out optional(3) VarStruct p3);

    optional(1) OneOptional opOneOptional(optional(2) OneOptional p1, out optional(3) OneOptional p3);
    ["java:optional"] optional(1) OneOptional opOneOptionalOpt(optional(2) OneOptional p1,
                                                               out optional(3) OneOptional p3);

    optional(1) OneOptional* opOneOptionalProxy(optional(2) OneOptional* p1, out optional(3) OneOptional* p3);
    ["java:optional"] optional(1) OneOptional* opOneOptionalProxyOpt(optional(2) OneOptional* p1,
                                                                     out optional(3) OneOptional* p3);

    optional(1) ByteSeq opByteSeq(optional(2) ByteSeq p1, out optional(3) ByteSeq p3);
    ["java:optional"] optional(1) ByteSeq opByteSeqOpt(optional(2) ByteSeq p1, out optional(3) ByteSeq p3);

    optional(1) BoolSeq opBoolSeq(optional(2) BoolSeq p1, out optional(3) BoolSeq p3);
    ["java:optional"] optional(1) BoolSeq opBoolSeqOpt(optional(2) BoolSeq p1, out optional(3) BoolSeq p3);

    optional(1) ShortSeq opShortSeq(optional(2) ShortSeq p1, out optional(3) ShortSeq p3);
    ["java:optional"] optional(1) ShortSeq opShortSeqOpt(optional(2) ShortSeq p1, out optional(3) ShortSeq p3);

    optional(1) IntSeq opIntSeq(optional(2) IntSeq p1, out optional(3) IntSeq p3);
    ["java:optional"] optional(1) IntSeq opIntSeqOpt(optional(2) IntSeq p1, out optional(3) IntSeq p3);

    optional(1) LongSeq opLongSeq(optional(2) LongSeq p1, out optional(3) LongSeq p3);
    ["java:optional"] optional(1) LongSeq opLongSeqOpt(optional(2) LongSeq p1, out optional(3) LongSeq p3);

    optional(1) FloatSeq opFloatSeq(optional(2) FloatSeq p1, out optional(3) FloatSeq p3);
    ["java:optional"] optional(1) FloatSeq opFloatSeqOpt(optional(2) FloatSeq p1, out optional(3) FloatSeq p3);

    optional(1) DoubleSeq opDoubleSeq(optional(2) DoubleSeq p1, out optional(3) DoubleSeq p3);
    ["java:optional"] optional(1) DoubleSeq opDoubleSeqOpt(optional(2) DoubleSeq p1, out optional(3) DoubleSeq p3);

    optional(1) StringSeq opStringSeq(optional(2) StringSeq p1, out optional(3) StringSeq p3);
    ["java:optional"] optional(1) StringSeq opStringSeqOpt(optional(2) StringSeq p1, out optional(3) StringSeq p3);

    optional(1) SmallStructSeq opSmallStructSeq(optional(2) SmallStructSeq p1, out optional(3) SmallStructSeq p3);
    ["java:optional"] optional(1) SmallStructSeq opSmallStructSeqOpt(optional(2) SmallStructSeq p1,
                                                                     out optional(3) SmallStructSeq p3);

    optional(1) SmallStructList opSmallStructList(optional(2) SmallStructList p1, out optional(3) SmallStructList p3);
    ["java:optional"] optional(1) SmallStructList opSmallStructListOpt(optional(2) SmallStructList p1,
                                                                       out optional(3) SmallStructList p3);

    optional(1) FixedStructSeq opFixedStructSeq(optional(2) FixedStructSeq p1, out optional(3) FixedStructSeq p3);
    ["java:optional"] optional(1) FixedStructSeq opFixedStructSeqOpt(optional(2) FixedStructSeq p1,
                                                                     out optional(3) FixedStructSeq p3);

    optional(1) FixedStructList opFixedStructList(optional(2) FixedStructList p1, out optional(3) FixedStructList p3);
    ["java:optional"] optional(1) FixedStructList opFixedStructListOpt(optional(2) FixedStructList p1,
                                                                       out optional(3) FixedStructList p3);

    optional(1) VarStructSeq opVarStructSeq(optional(2) VarStructSeq p1, out optional(3) VarStructSeq p3);
    ["java:optional"] optional(1) VarStructSeq opVarStructSeqOpt(optional(2) VarStructSeq p1,
                                                                 out optional(3) VarStructSeq p3);

    optional(1) Serializable opSerializable(optional(2) Serializable p1, out optional(3) Serializable p3);
    ["java:optional"] optional(1) Serializable opSerializableOpt(optional(2) Serializable p1,
                                                                 out optional(3) Serializable p3);

    optional(1) IntIntDict opIntIntDict(optional(2) IntIntDict p1, out optional(3) IntIntDict p3);
    ["java:optional"] optional(1) IntIntDict opIntIntDictOpt(optional(2) IntIntDict p1, out optional(3) IntIntDict p3);

    optional(1) StringIntDict opStringIntDict(optional(2) StringIntDict p1, out optional(3) StringIntDict p3);
    ["java:optional"] optional(1) StringIntDict opStringIntDictOpt(optional(2) StringIntDict p1,
                                                                   out optional(3) StringIntDict p3);

    void opClassAndUnknownOptional(A p);
};

};
