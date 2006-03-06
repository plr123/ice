// **********************************************************************
//
// Copyright (c) 2003-2006 ZeroC, Inc. All rights reserved.
//
// This copy of Ice-E is licensed to you under the terms described in the
// ICEE_LICENSE file included in this distribution.
//
// **********************************************************************

package Ice;

public final class RoutingTable
{
    public
    RoutingTable()
    {
    }

    //
    // Clear the contents of the routing table.
    //
    synchronized public void
    clear()
    {
	_table.clear();
    }

    //
    // Returns false if the Proxy exists already.
    //
    public boolean
    add(ObjectPrx prx)
    {
        if(prx == null)
        {
            return false;
        }

	//
	// We insert the proxy in its default form into the routing table.
	//
        ObjectPrx proxy = prx.ice_twoway();

        synchronized(this)
        {
            if(!_table.containsKey(proxy.ice_getIdentity()))
            {
                _table.put(proxy.ice_getIdentity(), proxy);
                return true;
            }
            else
            {
                return false;
            }
        }
    }

    //
    // Returns null if no Proxy exists for the given identity.
    //
    public ObjectPrx
    get(Identity ident)
    {
        if(ident.name.length() == 0)
        {
            return null;
        }

        synchronized(this)
        {
            return (ObjectPrx)_table.get(ident);
        }
    }

    private java.util.Hashtable _table = new java.util.Hashtable();
}
