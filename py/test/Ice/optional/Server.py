#!/usr/bin/env python
# **********************************************************************
#
# Copyright (c) 2003-2012 ZeroC, Inc. All rights reserved.
#
# This copy of Ice is licensed to you under the terms described in the
# ICE_LICENSE file included in this distribution.
#
# **********************************************************************

import os, sys, traceback

import Ice
Ice.loadSlice('Test.ice')
import Test

class InitialI(Test.Initial):

    def shutdown(self, current=None):
        current.adapter.getCommunicator().shutdown()

    def pingPong(self, o, current=None):
        return o

    def opOptionalException(self, a, b, o, current=None):
        raise Test.OptionalException(a, b, o)

    def opDerivedException(self, a, b, o, current=None):
        raise Test.DerivedException(a, b, o, b, o)

    def opRequiredException(self, a, b, o, current=None):
        if b == Ice.Unset:
            ss = "none"
        else:
            ss = b
        if o == Ice.Unset:
            o2 = None
        else:
            o2 = o
        raise Test.RequiredException(a, b, o, ss, o2)

    def opByte(self, p1, current=None):
        return (p1, p1)

    def opBool(self, p1, current=None):
        return (p1, p1)

    def opShort(self, p1, current=None):
        return (p1, p1)

    def opInt(self, p1, current=None):
        return (p1, p1)

    def opLong(self, p1, current=None):
        return (p1, p1)

    def opFloat(self, p1, current=None):
        return (p1, p1)

    def opDouble(self, p1, current=None):
        return (p1, p1)

    def opString(self, p1, current=None):
        return (p1, p1)

    def opMyEnum(self, p1, current=None):
        return (p1, p1)

    def opSmallStruct(self, p1, current=None):
        return (p1, p1)

    def opFixedStruct(self, p1, current=None):
        return (p1, p1)

    def opVarStruct(self, p1, current=None):
        return (p1, p1)

    def opOneOptional(self, p1, current=None):
        return (p1, p1)

    def opOneOptionalProxy(self, p1, current=None):
        return (p1, p1)

    def opByteSeq(self, p1, current=None):
        return (p1, p1)

    def opBoolSeq(self, p1, current=None):
        return (p1, p1)

    def opShortSeq(self, p1, current=None):
        return (p1, p1)

    def opIntSeq(self, p1, current=None):
        return (p1, p1)

    def opLongSeq(self, p1, current=None):
        return (p1, p1)

    def opFloatSeq(self, p1, current=None):
        return (p1, p1)

    def opDoubleSeq(self, p1, current=None):
        return (p1, p1)

    def opStringSeq(self, p1, current=None):
        return (p1, p1)

    def opSmallStructSeq(self, p1, current=None):
        return (p1, p1)

    def opSmallStructList(self, p1, current=None):
        return (p1, p1)

    def opFixedStructSeq(self, p1, current=None):
        return (p1, p1)

    def opFixedStructList(self, p1, current=None):
        return (p1, p1)

    def opVarStructSeq(self, p1, current=None):
        return (p1, p1)

    def opIntIntDict(self, p1, current=None):
        return (p1, p1)

    def opStringIntDict(self, p1, current=None):
        return (p1, p1)

    def opClassAndUnknownOptional(self, p, current=None):
        pass

def run(args, communicator):
    communicator.getProperties().setProperty("TestAdapter.Endpoints", "default -p 12010:udp")
    adapter = communicator.createObjectAdapter("TestAdapter")
    initial = InitialI()
    adapter.add(initial, communicator.stringToIdentity("initial"))
    adapter.activate()

    communicator.waitForShutdown()
    return True

try:
    communicator = Ice.initialize(sys.argv)
    status = run(sys.argv, communicator)
except:
    traceback.print_exc()
    status = False

if communicator:
    try:
        communicator.destroy()
    except:
        traceback.print_exc()
        status = False

sys.exit(not status)
