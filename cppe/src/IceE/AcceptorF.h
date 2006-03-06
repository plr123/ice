// **********************************************************************
//
// Copyright (c) 2003-2006 ZeroC, Inc. All rights reserved.
//
// This copy of Ice-E is licensed to you under the terms described in the
// ICEE_LICENSE file included in this distribution.
//
// **********************************************************************

#ifndef ICEE_ACCEPTOR_F_H
#define ICEE_ACCEPTOR_F_H

#include <IceE/Handle.h>

namespace IceInternal
{

class Acceptor;
ICE_API void incRef(Acceptor*);
ICE_API void decRef(Acceptor*);
typedef Handle<Acceptor> AcceptorPtr;

}

#endif
