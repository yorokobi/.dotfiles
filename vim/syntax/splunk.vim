" Vim syntax file
" Language: Splunk configuration files
" Maintainer: Colby Williams <colwilliams@splunk.com>
" Last Change: 2013 Jan 31 

if version < 600
    syntax clear
elseif exists("b:current_syntax")
    finish
endif

setlocal iskeyword+=-
syn case match

syn match confComment /^#.*/ contains=confTodo oneline display
syn match confSpecComment /^\s*\*.*/ contains=confTodo oneline display

syn keyword confBoolean on off true false 0 1
syn keyword confTodo FIXME NOTE TODO contained

" admon.conf
syn keyword confADmon targetDc startingNode monitorSubtree disabled index

" alert_actions.conf
syn keyword confAlertActionsStanzas default email rss script summary_index populate_lookup
syn keyword confAlertActions maxresults hostname ttl maxtime track_alert command
syn keyword confAlertActions from to cc bcc subject format sendresults inline
syn keyword confAlertActions mailserver use_ssl use_tls auth_username auth_password
syn keyword confAlertActions sendpdf pdfview reportServerEnabled reportServerURL
syn keyword confAlertActions reportPaperSize reportPaperOrientation reportIncludeSplunkLogo
syn keyword confAlertActions reportCIDFontList width_sort_columns preprocess_results
syn keyword confAlertActions items_count filename _name dest

" app.conf
syn keyword confAppStanzas launcher package install triggers ui credentials_settings credential:
syn keyword confApp remote_tab version description author id check_for_updates
syn keyword confApp state state_change_requires_restart is_configured build allows_disable
syn keyword confApp reload. is_visible is_manageable label verify_script password

" audit.conf
syn keyword confAuditStanzas eventHashing filterSpec: auditTrail
syn keyword confAudit filters all source host sourcetype privateKey publicKey queueing

" authentication.conf
syn keyword confAuthenticationStanzas authentication roleMap_ cacheTiming
syn keyword confAuthentication authType authSettings host SSLEnabled port bindDN bindDNpassword
syn keyword confAuthentication userBaseDN userBaseFilter userNameAttribute realNameAttribute
syn keyword confAuthentication groupMappingAttribute groupBaseDN groupBaseFilter dynamicGroupFilter
syn keyword confAuthentication dynamicMemberAttribute groupNameAttribute groupMemberAttribute
syn keyword confAuthentication nestedGroups charset anonymous_referrals sizelimit timelimit
syn keyword confAuthentication network_timeout scriptPath scriptSearchFilters userLoginTTL
syn keyword confAuthentication getUserInfoTTL getUsersTTL

" authorize.conf
syn keyword confAuthorizeStanzas default capability:: role_ 
syn keyword confAuthorize importRoles srchFilter srchTimeWin srchDiskQuota srchJobsQuota
syn keyword confAuthorize rtSrchJobsQuota srchMaxTime srchIndexesDefault srchIndexesAllowed

" commands.conf
syn keyword confCommandsStanzas default
syn keyword confCommands type filename local perf_warn_limit streaming maxinputs passauth
syn keyword confCommands run_in_preview enableheader retainsevents generating generates_timeorder
syn keyword confCommands overrides_timeorder requires_preop streaming_preop required_fields
syn keyword confCommands supports_multivalues supports_getinfo supports_rawargs
syn keyword confCommands requires_srinfo needs_empty_results changes_colorder clear_required_fields
syn keyword confCommands stderr_dest outputheader

" crawl.conf
syn keyword confCrawlStanzas default files
syn keyword confCrawl root bad_directories_list bad_extensions_list

" default-mode.conf
syn keyword confDefModeStanzas pipeline:
syn keyword confDefMode disabled disabled_processors

" deploymentclient.conf
syn keyword confDeployClientStanzas deployment-client target-broker:deploymentServer
syn keyword confDeployClient disabled clientName workingDir repositoryLocation
syn keyword confDeployClient serverRepositoryLocationPolicy endpoint serverEndpointPolicy
syn keyword confDeployClient phoneHomeIntervalInSecs handshakeRetryIntervalInSecs
syn keyword confDeployClient reloadDSOnAppInstall targetUri

" distsearch.conf
syn keyword confDistSearchStanzas distributedSearch tokenExchKeys replicationSettings
syn keyword confDistSearchStanzas replicationSettings:refineConf replicationWhitelist
syn keyword confDistSearchStanzas replicationBlacklist searchhead:
syn keyword confDistSearch disabled heartbeatMcastAddr heartbeatPort ttl heartbeatFrequency
syn keyword confDistSearch statusTimeout removedTimedOutServers checkTimedOutServersFrequency
syn keyword confDistSearch autoAddServers bestEffortSearch skipOurselves servers disabled_servers
syn keyword confDistSearch shareBundles useSHPBundleReplication serverTimeout connectionTimeout
syn keyword confDistSearch sendTimeout receiveTimeout certDir publicKey privateKey genKeyScript
syn keyword confDistSearch connectionTimeout sendRcvTimeout replicationThreads maxMemoryBundleSize
syn keyword confDistSearch maxBundleSize concerningReplicatedFileSize allowStreamUpload
syn keyword confDistSearch allowSkipEncoding allowDeltaUpload sanitizeMetaFiles
syn keyword confDistSearch replicate mounted_bundles bundles_location

" event_renderers.conf
syn keyword confEventRenderStanzas default
syn keyword confEventRender eventtype priority template css_class

" eventdiscoverer.conf
syn keyword confEventDiscoverStanzas default
syn keyword confEventDiscover ignored_keywords ignored_fields important_keywords

" eventgen.conf
syn keyword confEventGenStanzas default global
syn keyword confEventGen spoolDir spoolFile interval count earliest latest breaker token replacementType
syn keyword confEventGen replacement

" eventtypes.conf
syn keyword confEventTypesStanzas default
syn keyword confEventTypes disabled search priority description tags

" fields.conf
syn keyword confFieldsStanzas
syn keyword confFields

" indexes.conf
syn keyword confIndexesStanzas
syn keyword confIndexes

" inputs.conf
syn keyword confInputsStanzas
syn keyword confInputs

" limits.conf
syn keyword confLimitsStanzas
syn keyword confLimits

" literals.conf
syn keyword confLiteralsStanzas
syn keyword confLiterals

" macros.conf
syn keyword confMacrosStanzas
syn keyword confMacros

" multikv.conf
syn keyword confMultikvStanzas
syn keyword confMultikv

" outputs.conf
syn keyword confOutputsStanzas
syn keyword confOutputs

" pdf_server.conf
syn keyword confPDFserverStanzas
syn keyword confPDFserver

" procmon-filters.conf
syn keyword confProcmonFiltersStanzas
syn keyword confProcmonFilters

" props.conf
syn keyword confPropsStanzas
syn keyword confProps

" pubsub.conf
syn keyword confPubsubStanzas
syn keyword confPubsub

" regmon-filters.conf
syn keyword confRegmonFiltersStanzas
syn keyword confRegmonFilters

" restmap.conf
syn keyword confRestmapStanzas
syn keyword confRestmap

" savedsearches.conf
syn keyword confSavedSearchesStanzas
syn keyword confSavedSearches

" searchbnf.conf
syn keyword confSearchbnfStanzas
syn keyword confSearchbnf

" segmenters.conf
syn keyword confSegmentersStanzas
syn keyword confSegmenters

" server.conf
syn keyword confServerStanzas
syn keyword confServer

" serverclass.conf
syn keyword confServerClassStanzas
syn keyword confServerClass

" source-classifier.conf
syn keyword confSourceClassStanzas
syn keyword confSourceClass

" sourcetypes.conf
syn keyword confSourceTypesStanzas
syn keyword confSourceTypes

" splunk-launch.conf
syn keyword confSplunkLaunchStanzas
syn keyword confSplunkLaunch

" tags.conf
syn keyword confTagsStanzas
syn keyword confTags

" tenants.conf
syn keyword confTenantsStanzas
syn keyword confTenants

" times.conf
syn keyword confTimesStanzas
syn keyword confTimes

" transactiontypes.conf
syn keyword confTransactionTypesStanzas
syn keyword confTransactionTypes

" transforms.conf
syn keyword confTransformsStanzas
syn keyword confTransforms

" user-seed.conf
syn keyword confUserSeedStanzas
syn keyword confUserSeed

" viewstates.conf
syn keyword confViewStatesStanzas
syn keyword confViewStates

" web.conf
syn keyword confWebStanzas
syn keyword confWeb

" wmi.conf
syn keyword confWmiStanzas
syn keyword confWmi

" workflow_actions.conf
syn keyword confWorkflowActionsStanzas
syn keyword confWorkflowActions


" Define stanzas
syn region confStanza matchgroup=confStanzaStart start=/^\[/ matchgroup=confStanzaEnd end=/\]/ oneline display contains=confStanzas

" Highlight definitions (generic)
hi def link confComment Comment
hi def link confSpecComment Comment
hi def link confBoolean Boolean
hi def link confTodo Todo

hi def link confStanzaStart Type
hi def link confstanzaEnd Type

" Group clusters
"syn cluster confStanzas contains=confAlertActionStanzas,confAppStanzas,confAuditStanzas,confAuthenticationStanzas,confAuthorizeStanzas,confCommandsStanzas,confCrawlStanzas,confDefmodeStanzas

" Highlight for stanzas
hi def link confStanza Function
"hi def link confStanzas Debug

" Highlight definitions (by .conf)
hi def link confADmon Keyword
hi def link confAlertActions Keyword
hi def link confApp Keyword
hi def link confAudit Keyword
hi def link confAuthentication Keyword
hi def link confAuthorize Keyword
hi def link confCommands Keyword
hi def link confCrawl Keyword
hi def link confDefmode Keyword
hi def link confDeployClient Keyword
hi def link confDistSearch Keyword
hi def link confEventRender Keyword
hi def link confEventDiscover Keyword
hi def link confEventGen Keyword
hi def link confEventTypes Keyword
hi def link confFields Keyword
hi def link confIndexes Keyword
hi def link confInputs Keyword
hi def link confLimits Keyword
hi def link confLiterals Keyword
hi def link confMacros Keyword
hi def link confMultikv Keyword
hi def link confOutputs Keyword
hi def link confPDFserver Keyword
hi def link confProcmonFilters Keyword
hi def link confProps Keyword
hi def link confPubsup Keyword
hi def link confRegmonFilters Keyword
hi def link confRestmap Keyword
hi def link confSavedSearches Keyword
hi def link confSearchbnf Keyword
hi def link confSegmenters Keyword
hi def link confServer Keyword
hi def link confServerClass Keyword
hi def link confSourceClass Keyword
hi def link confSourceTypes Keyword
hi def link confSplunkLaunch Keyword
hi def link confTags Keyword
hi def link confTenants Keyword
hi def link confTimes Keyword
hi def link confTransactionTypes Keyword
hi def link confTransforms Keyword
hi def link confUserSeed Keyword
hi def link confViewStates Keyword
hi def link confWeb Keyword
hi def link confWmi Keyword
hi def link confWorkflowActions Keyword
