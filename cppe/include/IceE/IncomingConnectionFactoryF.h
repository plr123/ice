// **********************************************************************
//
// Copyright (c) 2003-2006 ZeroC, Inc. All rights reserved.
//
// This copy of Ice-E is licensed to you under the terms described in the
// ICEE_LICENSE file included in this distribution.
//
// **********************************************************************

#ifndef ICEE_INCOMING_CONNECTION_FACTORY_F_H
#define ICEE_INCOMING_CONNECTION_FACTORY_F_H

#include <IceE/Handle.h>

namespace IceInternal
{

class IncomingConnectionFactory;
ICE_API void incRef(IncomingConnectionFactory*);
ICE_API void decRef(IncomingConnectionFactory*);
typedef IceInternal::Handle<IncomingConnectionFactory> IncomingConnectionFactoryPtr;

}

#endif
