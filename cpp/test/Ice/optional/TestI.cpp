// **********************************************************************
//
// Copyright (c) 2003-2016 ZeroC, Inc. All rights reserved.
//
// This copy of Ice is licensed to you under the terms described in the
// ICE_LICENSE file included in this distribution.
//
// **********************************************************************

#include <Ice/Ice.h>
#include <TestI.h>

using namespace Test;
using namespace IceUtil;
using namespace Ice;
using namespace std;

InitialI::InitialI()
{
}

void
InitialI::shutdown(const Current& current)
{
    current.adapter->getCommunicator()->shutdown();
}

ValuePtr
InitialI::pingPong(ICE_IN(ValuePtr) obj, const Current&)
{
    return obj;
}

void
InitialI::opOptionalException(ICE_IN(Optional<Int>) a,
                              ICE_IN(Optional<string>) b,
                              ICE_IN(Optional<OneOptionalPtr>) o,
                              const Ice::Current&)
{
    OptionalException ex;
    ex.a = a;
    ex.b = b;
    ex.o = o;
    throw ex;
}

void
InitialI::opDerivedException(ICE_IN(Optional<Int>) a,
                             ICE_IN(Optional<string>) b,
                             ICE_IN(Optional<OneOptionalPtr>) o,
                             const Ice::Current&)
{
    DerivedException ex;
    ex.a = a;
    ex.b = b;
    ex.o = o;
    ex.ss = b;
    ex.o2 = o;
    throw ex;
}

void
InitialI::opRequiredException(ICE_IN(Optional<Int>) a,
                              ICE_IN(Optional<string>) b,
                              ICE_IN(Optional<OneOptionalPtr>) o,
                              const Ice::Current&)
{
    RequiredException ex;
    ex.a = a;
    ex.b = b;
    ex.o = o;
    if(b)
    {
        ex.ss = b.value();
    }
    if(o)
    {
        ex.o2 = o.value();
    }
    throw ex;
}

Optional<Ice::Byte>
InitialI::opByte(ICE_IN(Optional<Ice::Byte>) p1, Optional<Ice::Byte>& p3, const Current&)
{
    p3 = p1;
    return p1;
}

Optional<bool>
InitialI::opBool(ICE_IN(Optional<bool>) p1, Optional<bool>& p3, const Current&)
{
    p3 = p1;
    return p1;
}

Optional<Short>
InitialI::opShort(ICE_IN(Optional<Short>) p1, Optional<Short>& p3, const Current&)
{
    p3 = p1;
    return p1;
}

Optional<Int>
InitialI::opInt(ICE_IN(Optional<Int>) p1, Optional<Int>& p3, const Current&)
{
    p3 = p1;
    return p1;
}

Optional<Long>
InitialI::opLong(ICE_IN(Optional<Long>) p1, Optional<Long>& p3, const Current&)
{
    p3 = p1;
    return p1;
}

Optional<Float>
InitialI::opFloat(ICE_IN(Optional<Float>) p1, Optional<Float>& p3, const Current&)
{
    p3 = p1;
    return p1;
}

Optional<Double>
InitialI::opDouble(ICE_IN(Optional<Double>) p1, Optional<Double>& p3, const Current&)
{
    p3 = p1;
    return p1;
}

Optional<string>
InitialI::opString(ICE_IN(Optional<string>) p1, Optional<string>& p3, const Current&)
{
    p3 = p1;
    return p1;
}

Optional<string>
InitialI::opCustomString(ICE_IN(Optional<Util::string_view>) p1, Optional<string>& p3, const Current&)
{
    if(p1)
    {
        p3 = p1->to_string();
    }
    return p3;
}


Optional<MyEnum>
InitialI::opMyEnum(ICE_IN(Optional<MyEnum>) p1, Optional<MyEnum>& p3, const Current&)
{
    p3 = p1;
    return p1;
}

Optional<SmallStruct>
InitialI::opSmallStruct(ICE_IN(Optional<SmallStruct>) p1, Optional<SmallStruct>& p3, const Current&)
{
    p3 = p1;
    return p1;
}

Optional<FixedStruct>
InitialI::opFixedStruct(ICE_IN(Optional<FixedStruct>) p1, Optional<FixedStruct>& p3, const Current&)
{
    p3 = p1;
    return p1;
}

Optional<VarStruct>
InitialI::opVarStruct(ICE_IN(Optional<VarStruct>) p1, Optional<VarStruct>& p3, const Current&)
{
    p3 = p1;
    return p1;
}

Optional<OneOptionalPtr>
InitialI::opOneOptional(ICE_IN(Optional<OneOptionalPtr>) p1, Optional<OneOptionalPtr>& p3, const Current&)
{
    p3 = p1;
    return p1;
}

Optional<OneOptionalPrxPtr>
InitialI::opOneOptionalProxy(ICE_IN(Optional<OneOptionalPrxPtr>) p1, Optional<OneOptionalPrxPtr>& p3, const Current&)
{
    p3 = p1;
    return p1;
}

Optional<Test::ByteSeq>
InitialI::opByteSeq(ICE_IN(Optional<pair<const Ice::Byte*, const Ice::Byte*> >) p1, Optional<Test::ByteSeq>& p3,
                    const Current&)
{
    if(p1)
    {
        p3 = Ice::ByteSeq(p1->first, p1->second);
    }
    return p3;
}

Optional<Test::BoolSeq>
InitialI::opBoolSeq(ICE_IN(Optional<pair<const bool*, const bool*> >) p1, Optional<Test::BoolSeq>& p3, const Current&)
{
    if(p1)
    {
        p3 = Ice::BoolSeq(p1->first, p1->second);
    }
    return p3;
}

Optional<Test::ShortSeq>
InitialI::opShortSeq(ICE_IN(Optional<pair<const Short*, const Short*> >) p1, Optional<Test::ShortSeq>& p3,
                     const Current&)
{
    if(p1)
    {
        p3 = Ice::ShortSeq(p1->first, p1->second);
    }
    return p3;
}

Optional<Test::IntSeq>
InitialI::opIntSeq(ICE_IN(Optional<pair<const Int*, const Int*> >) p1, Optional<Test::IntSeq>& p3, const Current&)
{
    if(p1)
    {
        p3 = Test::IntSeq(p1->first, p1->second);
    }
    return p3;
}

Optional<Test::LongSeq>
InitialI::opLongSeq(ICE_IN(Optional<pair<const Long*, const Long*> >) p1, Optional<Test::LongSeq>& p3, const Current&)
{
    if(p1)
    {
        p3 = Test::LongSeq(p1->first, p1->second);
    }
    return p3;
}

Optional<Test::FloatSeq>
InitialI::opFloatSeq(ICE_IN(Optional<pair<const Float*, const Float*> >) p1, Optional<Test::FloatSeq>& p3,
                     const Current&)
{
    if(p1)
    {
        p3 = Test::FloatSeq(p1->first, p1->second);
    }
    return p3;
}

Optional<Test::DoubleSeq>
InitialI::opDoubleSeq(ICE_IN(Optional<pair<const Double*, const Double*> >) p1, Optional<Test::DoubleSeq>& p3,
                      const Current&)
{
    if(p1)
    {
        p3 = Test::DoubleSeq(p1->first, p1->second);
    }
    return p3;
}

#ifdef ICE_CPP11_MAPPING
optional<Ice::StringSeq>
InitialI::opStringSeq(optional<Ice::StringSeq> p1,
                      optional<Ice::StringSeq>& p3, const Current&)
{
    if(p1)
    {
        p3 = p1;
    }
    return p3;
}
#else
Optional<Ice::StringSeq>
InitialI::opStringSeq(const Optional<pair<Ice::StringSeq::const_iterator, Ice::StringSeq::const_iterator> >& p1,
                      Optional<Ice::StringSeq>& p3, const Current&)
{
    if(p1)
    {
        p3 = Ice::StringSeq(p1->first, p1->second);
    }
    return p3;
}
#endif

Optional<SmallStructSeq>
InitialI::opSmallStructSeq(ICE_IN(Optional<pair<const SmallStruct*, const SmallStruct*> >) p1,
                           Optional<SmallStructSeq>& p3, const Current&)
{
    if(p1)
    {
        p3 = SmallStructSeq(p1->first, p1->second);
    }
    return p3;
}

Optional<SmallStructList>
InitialI::opSmallStructList(ICE_IN(Optional<pair<const SmallStruct*, const SmallStruct*> >) p1,
                            Optional<SmallStructList>& p3, const Current&)
{
    if(p1)
    {
        p3 = SmallStructList(p1->first, p1->second);
    }
    return p3;
}

Optional<FixedStructSeq>
InitialI::opFixedStructSeq(ICE_IN(Optional<pair<const FixedStruct*, const FixedStruct*> >) p1,
                           Optional<FixedStructSeq>& p3, const Current&)
{
    if(p1)
    {
        p3 = FixedStructSeq(p1->first, p1->second);
    }
    return p3;
}

Optional<FixedStructList>
InitialI::opFixedStructList(ICE_IN(Optional<pair<const FixedStruct*, const FixedStruct*> >) p1,
                            Optional<FixedStructList>& p3, const Current&)
{
    if(p1)
    {
        p3 = FixedStructList(p1->first, p1->second);
    }
    return p3;
}

#ifdef ICE_CPP11_MAPPING
optional<VarStructSeq>
InitialI::opVarStructSeq(optional<VarStructSeq> p1,
                         optional<VarStructSeq>& p3, const Current&)
{
    if(p1)
    {
        p3 = p1;
    }
    return p3;
}
#else
Optional<VarStructSeq>
InitialI::opVarStructSeq(const Optional<pair<VarStructSeq::const_iterator, VarStructSeq::const_iterator> >& p1,
                         Optional<VarStructSeq>& p3, const Current&)
{
    if(p1)
    {
        p3 = VarStructSeq(p1->first, p1->second);
    }
    return p3;
}
#endif

Optional<Serializable>
InitialI::opSerializable(ICE_IN(Optional<Serializable>) p1, Optional<Serializable>& p3, const Current&)
{
    p3 = p1;
    return p3;
}

Optional<IntIntDict>
InitialI::opIntIntDict(ICE_IN(Optional<IntIntDict>) p1, Optional<IntIntDict>& p3, const Current&)
{
    p3 = p1;
    return p3;
}

Optional<StringIntDict>
InitialI::opStringIntDict(ICE_IN(Optional<StringIntDict>) p1, Optional<StringIntDict>& p3, const Current&)
{
    p3 = p1;
    return p3;
}

Optional<IntOneOptionalDict>
InitialI::opIntOneOptionalDict(ICE_IN(Optional<IntOneOptionalDict>) p1, Optional<IntOneOptionalDict>& p3, const Current&)
{
    p3 = p1;
    return p3;
}

Optional<IntStringDict>
InitialI::opCustomIntStringDict(ICE_IN(Optional<std::map<int, Util::string_view> >) p1,
                                Optional<IntStringDict>& p3, const Current&)
{
    if(p1)
    {
        p3 = IntStringDict();
        for(std::map<int, Util::string_view>::const_iterator p = p1->begin();
            p != p1->end(); ++p)
        {
            (*p3)[p->first] = p->second.to_string();
        }
    }
    return p3;
}


void
InitialI::opClassAndUnknownOptional(ICE_IN(APtr), const Ice::Current&)
{
}

void
InitialI::sendOptionalClass(bool, ICE_IN(Optional<OneOptionalPtr>), const Ice::Current&)
{
}

void
InitialI::returnOptionalClass(bool, Optional<OneOptionalPtr>& o, const Ice::Current&)
{
    o = ICE_MAKE_SHARED(OneOptional, 53);
}

GPtr
InitialI::opG(ICE_IN(GPtr) g, const Ice::Current&)
{
    return g;
}

void
InitialI::opVoid(const Ice::Current&)
{
}

bool
InitialI::supportsRequiredParams(const Ice::Current&)
{
    return false;
}

bool
InitialI::supportsJavaSerializable(const Ice::Current&)
{
    return true;
}

bool
InitialI::supportsCsharpSerializable(const Ice::Current&)
{
    return true;
}

bool
InitialI::supportsCppStringView(const Ice::Current&)
{
    return true;
}
