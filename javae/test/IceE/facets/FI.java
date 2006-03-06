// **********************************************************************
//
// Copyright (c) 2003-2006 ZeroC, Inc. All rights reserved.
//
// This copy of Ice-E is licensed to you under the terms described in the
// ICEE_LICENSE file included in this distribution.
//
// **********************************************************************

import Test.*;

public final class FI extends _FDisp
{
    public
    FI()
    {
    }

    public String
    callE(Ice.Current current)
    {
        return "E";
    }

    public String
    callF(Ice.Current current)
    {
        return "F";
    }
}
