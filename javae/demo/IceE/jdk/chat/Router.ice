// **********************************************************************
//
// Copyright (c) 2003-2006 ZeroC, Inc. All rights reserved.
//
// This copy of Ice-E is licensed to you under the terms described in the
// ICEE_LICENSE file included in this distribution.
//
// **********************************************************************

#ifndef GLACIER2_ROUTER_ICE
#define GLACIER2_ROUTER_ICE

#include <IceE/Router.ice>
#include <Session.ice>

/**
 *
 * &Glacier2; is a firewall solution for Ice. &Glacier2; authenticates
 * and filters client requests and allows callbacks to the client in a
 * secure fashion. In combination with &IceSSL;, &Glacier2; provides a
 * security solution that is both non-intrusive and easy to configure.
 *
 **/
module Glacier2
{

/**
 *
 * This exception is raised if a client is denied the ability to create
 * a session with the router.
 *
 * @see Router::createSession
 *
 **/
exception PermissionDeniedException
{
    /**
     *
     * The reason why permission was denied.
     *
     **/
    string reason;
};

/**
 *
 * This exception is raised if a client tries to destroy a session
 * with a router, but no session exists for the client.
 *
 * @see Router::destroySession
 *
 **/
exception SessionNotExistException
{
};

/**
 *
 * The &Glacier2; specialization of the standard &Ice; router
 * interface.
 *
 **/
interface Router extends Ice::Router
{
    /**
     *
     * Create a per-client session with the router. If a
     * [SessionManager] has been installed, a proxy to a [Session]
     * object is returned to the client. Otherwise, null is returned
     * and only an internal session (i.e., not visible to the client)
     * is created.
     *
     * @see Session
     * @see SessionManager
     * @see PermissionsVerifier
     *
     * @return A proxy for the newly created session, or null if no
     * [SessionManager] has been installed.
     *
     * @param userId The user id for which to check the password.
     *
     * @param password The password for the given user id.
     *
     * @throws PermissionDeniedException Raised if the password for
     * the given user id is not correct, or if the user is not allowed
     * access.
     *
     * @throws CannotCreateSessionException Raised if the session
     * cannot be created.
     *
     **/
    Session* createSession(string userId, string password)
	throws PermissionDeniedException, CannotCreateSessionException;

    /**
     *
     * Destroy the calling client's session with this router.
     *
     * @throws SessionNotExistException Raised if no session exists
     * for the calling client.
     *
     **/
    ["amd"] void destroySession()
	throws SessionNotExistException;
};

/**
 *
 * The &Glacier2; administrative interface. This must only be
 * accessible from inside the firewall.
 *
 **/
interface Admin
{
    /**
     *
     * Shut down the &Glacier2; router.
     *
     **/
    idempotent void shutdown();
};

};

#endif
