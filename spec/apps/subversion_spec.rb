require 'spec_helper'

describe 'Subversion' do
  it 'supported subversion' do
    expect(Dashv.supported?(:subversion)).to eq true
  end
  it 'supported svn' do
    expect(Dashv.supported?(:svn)).to eq true
  end
  it 'supported subversion too' do
    expect(Dashv.supported?('subversion')).to eq true
  end
  context 'when version is 1.6.17 (r1128011)' do
    before do
      stub_invoke <<-_EOS_
svn, version 1.6.17 (r1128011)
   compiled Jun 26 2013, 20:44:36

Copyright (C) 2000-2009 CollabNet.
Subversion is open source software, see http://subversion.apache.org/
This product includes software developed by CollabNet (http://www.Collab.Net/).

The following repository access (RA) modules are available:

* ra_neon : Module for accessing a repository via WebDAV protocol using Neon.
  - handles 'http' scheme
  - handles 'https' scheme
* ra_svn : Module for accessing a repository using the svn network protocol.
  - with Cyrus SASL authentication
  - handles 'svn' scheme
* ra_local : Module for accessing a repository on local disk.
  - handles 'file' scheme
      _EOS_
    end
    it 'returns version 1.6.17p1128011' do
      expect(Dashv['svn'].version).to eq '1.6.17p1128011'
    end
  end
  context 'when version is 1.8.9 (r1591380)' do
    before do
      stub_invoke <<-_EOS_
svn, version 1.8.9 (r1591380)
   compiled Jun 18 2014, 18:26:34 on x86_64-apple-darwin13.2.0

Copyright (C) 2014 The Apache Software Foundation.
This software consists of contributions made by many people;
see the NOTICE file for more information.
Subversion is open source software, see http://subversion.apache.org/

The following repository access (RA) modules are available:

* ra_svn : Module for accessing a repository using the svn network protocol.
  - with Cyrus SASL authentication
  - handles 'svn' scheme
* ra_local : Module for accessing a repository on local disk.
  - handles 'file' scheme
* ra_serf : Module for accessing a repository via WebDAV protocol using serf.
  - using serf 1.3.4
  - handles 'http' scheme
  - handles 'https' scheme
      _EOS_
    end
    it 'returns version 1.8.9p1591380' do
      expect(Dashv[:subversion].version).to eq '1.8.9p1591380'
    end
  end
end

