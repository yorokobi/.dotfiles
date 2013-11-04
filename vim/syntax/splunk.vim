" Vim syntax file
" Language: Splunk configuration files
" Maintainer: Colby Williams <colwilliams@splunk.com>
" Last Change: 2013 Feb 01 11:24 UTC-7

if version < 600
    syntax clear
elseif exists("b:current_syntax")
    finish
endif

setlocal iskeyword+=-
setlocal iskeyword+=.
setlocal iskeyword+=:
syn case match

syn match confComment /^#.*/ contains=confTodo oneline display
syn match confSpecComment /^\s*\*.*/ contains=confTodo oneline display

syn region confString start=/"/ end=/"/ oneline display

syn keyword confBoolean on off true false 0 1 True False
syn keyword confTodo FIXME NOTE TODO contained

" Define stanzas
syn region confStanza matchgroup=confStanzaStart start=/^\[/ matchgroup=confStanzaEnd end=/\]/ oneline display contains=@confStanzas

" Group clusters (incomplete)
syn cluster confStanzas contains=confAlertActionStanzas,confAppStanzas,confAuditStanzas,confAuthenticationStanzas,confAuthorizeStanzas,confCommandsStanzas,confCrawlStanzas,confDataModelsStanzas,confDefmodeStanzas,confDeployClientStanzas,confDistSearchStanzas,confEventGenStanzas,confEventRenderStanzas,confEventDiscoverStanzas,confEventTypesStanzas,confFieldsStanzas,confIndexesStanzas,confInputsStanzas,confLimitsStanzas,confOutputsStanzas,confPDFserverStanzas,confPropsStanzas,confPubsubStanzas,confRegmonFiltersStanzas,confRestmapStanzas,confSavedSearchesStanzas,confSegmenterStanzas,confServerStanzas,confServerClassStanzas,confSourceTypesStanzas,confTenantsStanzas,confTimesStanzas,confTransactionTypesStanzas,confTransformsStanzas,confUIPrefsStanzas,confUserSeedStanzas,confViewStatesStanzas,confWebStanzas,confWmiStanzas,confWorkflowActionsStanzas

" admon.conf
syn keyword confADmon targetDc startingNode monitorSubtree disabled index

" alert_actions.conf
syn keyword confAlertActionsStanzas contained default email rss script summary_index populate_lookup
syn keyword confAlertActions maxresults hostname ttl maxtime track_alert command
syn keyword confAlertActions from to cc bcc subject format sendresults inline
syn keyword confAlertActions mailserver use_ssl use_tls auth_username auth_password
syn keyword confAlertActions sendpdf pdfview reportServerEnabled reportServerURL
syn keyword confAlertActions reportPaperSize reportPaperOrientation reportIncludeSplunkLogo
syn keyword confAlertActions reportCIDFontList width_sort_columns preprocess_results
syn keyword confAlertActions items_count filename _name dest

" app.conf
syn keyword confAppStanzas contained launcher package install triggers ui credentials_settings credential:
syn keyword confApp remote_tab version description author id check_for_updates docs_section_override
syn keyword confApp state state_change_requires_restart is_configured build allows_disable
syn keyword confApp reload. is_visible is_manageable label verify_script password

" audit.conf
syn keyword confAuditStanzas contained eventHashing filterSpec: auditTrail
syn keyword confAudit filters all source host sourcetype privateKey publicKey queueing

" authentication.conf
syn keyword confAuthenticationStanzas contained authentication roleMap_ cacheTiming
syn keyword confAuthentication authType authSettings host SSLEnabled port bindDN bindDNpassword
syn keyword confAuthentication userBaseDN userBaseFilter userNameAttribute realNameAttribute
syn keyword confAuthentication groupMappingAttribute groupBaseDN groupBaseFilter dynamicGroupFilter
syn keyword confAuthentication dynamicMemberAttribute groupNameAttribute groupMemberAttribute
syn keyword confAuthentication nestedGroups charset anonymous_referrals sizelimit timelimit
syn keyword confAuthentication network_timeout scriptPath scriptSearchFilters userLoginTTL
syn keyword confAuthentication getUserInfoTTL getUsersTTL passwordHashAlgorithm

" authorize.conf
syn keyword confAuthorizeStanzas contained default capability:: role_ 
syn keyword confAuthorize importRoles srchFilter srchTimeWin srchDiskQuota srchJobsQuota
syn keyword confAuthorize rtSrchJobsQuota srchMaxTime srchIndexesDefault srchIndexesAllowed
syn keyword confAuthorize cumulativeSrchJobsQuota cumulativeRTSrchJobsQuota

" commands.conf
syn keyword confCommandsStanzas contained default
syn keyword confCommands type filename local perf_warn_limit streaming maxinputs passauth
syn keyword confCommands run_in_preview enableheader retainsevents generating generates_timeorder
syn keyword confCommands overrides_timeorder requires_preop streaming_preop required_fields
syn keyword confCommands supports_multivalues supports_getinfo supports_rawargs
syn keyword confCommands requires_srinfo needs_empty_results changes_colorder clear_required_fields
syn keyword confCommands stderr_dest outputheader

" crawl.conf
syn keyword confCrawlStanzas contained default files
syn keyword confCrawl root bad_directories_list bad_extensions_list bad_file_matches_list packed_extensions_list
syn keyword confCrawl collapse_threshold days_sizek_pairs_list big_dir_filecount max_badfiles_per_dir subnet

" datamodels.conf
syn keyword confDataModelsStanzas contained default
syn keyword confDataModels acceleration acceleration.earliest_time acceleration.cron_schedule

" default-mode.conf
syn keyword confDefModeStanzas contained pipeline:
syn keyword confDefMode disabled disabled_processors

" deploymentclient.conf
syn keyword confDeployClientStanzas contained deployment-client target-broker:deploymentServer
syn keyword confDeployClient disabled clientName workingDir repositoryLocation
syn keyword confDeployClient serverRepositoryLocationPolicy endpoint serverEndpointPolicy
syn keyword confDeployClient phoneHomeIntervalInSecs handshakeRetryIntervalInSecs
syn keyword confDeployClient reloadDSOnAppInstall targetUri

" distsearch.conf
syn keyword confDistSearchStanzas contained distributedSearch tokenExchKeys replicationSettings
syn keyword confDistSearchStanzas contained replicationSettings:refineConf replicationWhitelist
syn keyword confDistSearchStanzas contained replicationBlacklist searchhead:
syn keyword confDistSearch disabled heartbeatMcastAddr heartbeatPort ttl heartbeatFrequency
syn keyword confDistSearch statusTimeout removedTimedOutServers checkTimedOutServersFrequency
syn keyword confDistSearch autoAddServers bestEffortSearch skipOurselves servers disabled_servers
syn keyword confDistSearch shareBundles useSHPBundleReplication serverTimeout connectionTimeout
syn keyword confDistSearch sendTimeout receiveTimeout certDir publicKey privateKey genKeyScript
syn keyword confDistSearch connectionTimeout sendRcvTimeout replicationThreads maxMemoryBundleSize
syn keyword confDistSearch maxBundleSize concerningReplicatedFileSize allowStreamUpload
syn keyword confDistSearch allowSkipEncoding allowDeltaUpload sanitizeMetaFiles
syn keyword confDistSearch replicate mounted_bundles bundles_location trySSLFirst peerResolutionThreads
syn keyword confDistSearch authTokenConnectionTimeout authTokenSendTimeout authTokenReceiveTimeout

" event_renderers.conf
syn keyword confEventRenderStanzas contained default
syn keyword confEventRender eventtype priority template css_class

" eventdiscoverer.conf
syn keyword confEventDiscoverStanzas contained default
syn keyword confEventDiscover ignored_keywords ignored_fields important_keywords

" eventgen.conf
syn keyword confEventGenStanzas contained default global
syn keyword confEventGen spoolDir spoolFile interval count earliest latest breaker token replacementType
syn keyword confEventGen replacement

" eventtypes.conf
syn keyword confEventTypesStanzas contained default
syn keyword confEventTypes disabled search priority description tags

" fields.conf
syn keyword confFieldsStanzas contained default
syn keyword confFields TOKENIZER INDEXED INDEXED_VALUE

" indexes.conf
syn keyword confIndexesStanzas contained default volume:
syn keyword confIndexes sync defaultDatabase queryLanguageDefinition blockSignatureDatabase
syn keyword confIndexes memPoolMB indexThreads assureUTF8 enableRealtimeSearch suppressBannerList
syn keyword confIndexes maxRunningProcessGroups maxRunningProcessGroupsLowPriority bucketRebuildMemoryHint
syn keyword confIndexes serviceOnlyAsNeeded serviceSubtaskTimingPeriod maxBucketSizeCacheEntries 
syn keyword confIndexes tsidxStatsHomePath disabled deleted homePath coldPath thawedPath 
syn keyword confIndexes bloomHomePath createBloomfilter summaryHomePath maxBloomBackfillBucketAge
syn keyword confIndexes enableOnlineBucketRepair maxWarmDBCount maxTotalDataSizeMB
syn keyword confIndexes rotatePeriodInSecs frozenTimePeriodInSecs warmToColdScript
syn keyword confIndexes coldToFrozenScript coldToFrozenDir compressRawdata maxConcurrentOptimizes
syn keyword confIndexes maxDataSize rawFileSizeBytes rawChunkSizeBytes minRawFileSyncSecs maxMemMB
syn keyword confIndexes blockSignSize maxHotSpanSecs maxHotIdleSecs maxHotBuckets quarantinePastSecs
syn keyword confIndexes quarantineFutureSecs maxMetaEntries syncMeta serviceMetaPeriod
syn keyword confIndexes partialServiceMetaPeriod throttleCheckPeriod maxTimeUnreplicatedWithAcks
syn keyword confIndexes maxTimeUnreplicatedNoAcks isReadOnly homePath.maxDataSizeMB coldPath.maxDataSizeMB
syn keyword confIndexes disableGlobalMetadata repFactor path maxVolumeDataSizeMB rotatePeriodInSecs
syn keyword confIndexes inPlaceUpdates processTrackerServiceInterval tstatsHomePath minStreamGroupQueueSize

" inputs.conf
syn keyword confInputsStanzas contained default monitor: batch: tcp: splunktcp: splunktcp-ssl: tcp-ssl: SSL udp: fifo:
syn keyword confInputsStanzas contained script: fschange: filter: WinEventLog:
syn keyword confInputs host index source sourcetype queue _TCP_ROUTING _SYSLOG_ROUTING
syn keyword confInputs host_regex host_segment crcSalt initCrcLength ignoreOlderThan
syn keyword confInputs whitelist blacklist _whitelist _blacklist
syn keyword confInputs followTail alwaysOpenFile time_before_close recursive followSymlink dedicatedFD
syn keyword confInputs move_policy connection_host queueSize persistentQueueSize
syn keyword confInputs requireHeader listenOnIPv6 acceptFrom rawTcpDoneTimeout route compressed
syn keyword confInputs enableS2SHeartbeat s2sHeartbeatTimeout inputShutdownTimeout 
syn keyword confInputs serverCert password rootCA requireClientCert supportSSLV3Only cipherSuite
syn keyword confInputs _rcvbuf no_priority_stripping no_appending_timestamp interval passAuth
syn keyword confInputs signedaudit filters recurse followLinks pollPeriod hashMaxSize fullEvent 
syn keyword confInputs sendEventMaxSize filesPerDelay delayInMills regex
syn keyword confInputs disabled start_from current_only checkpointInterval evt_resolve_ad_obj evt_dc_name
syn keyword confInputs evt_dns_name _INDEX_AND_FORWARD_ROUTING negotiateNewProtocol concurrentChannelLimit
syn keyword confInputs allowSslRenegotiation start_by_shell object counters instances samplingInterval stats showZeroValue
syn keyword confInputs suppress_text printSchema remoteAddress process user addressFamily packetType direction protocol
syn keyword confInputs protocol readInterval driverBufferSize userBufferSize multikvMaxEventCount multikvMaxTimeMs

" limits.conf
syn keyword confLimitsStanzas contained default searchresults subsearch anomalousvalue associate autoregress
syn keyword confLimitsStanzas contained concurrency ctable correlate discretize export extern inputcsv
syn keyword confLimitsStanzas contained indexpreview join kmeans kv lookup metrics rare restapi search
syn keyword confLimitsStanzas contained realtime slc sort stats sistats thruput journal_compress summarize
syn keyword confLimitsStanzas contained transactions inputproc scheduler auto_summarizer show_source
syn keyword confLimitsStanzas contained typeahead typer authtokens sample metadata set input_channels
syn keyword confLimitsStanzas contained ldap spath reversedns viewstates tscollect pdf
syn keyword confLimits max_mem_usage_mb maxresultrows tocsv_maxretry tocsv_retryperiod_ms maxout
syn keyword confLimits maxtime ttl maxvalues maxvaluesize maxfields maxp maxrange
syn keyword confLimits max_count maxbins add_timestamp add_offset perf_warn_limit mkdir_max_retries
syn keyword confLimits max_preview_bytes max_results_perchunk soft_preview_queue_size
syn keyword confLimits subsearch_maxout subsearch_maxtime subsearch_timeout maxdatapoints maxkvalue
syn keyword confLimits maxkrange maxcols limit maxchars max_extractor_time avg_extractor_time
syn keyword confLimits max_memtable_bytes max_matches max_reverse_matches batch_index_query
syn keyword confLimits batch_response_limit maxseries interval time_format_reject jobscontentmaxcount
syn keyword confLimits summary_mode use_bloomfilter ttl default_save_ttl remote_ttl status_buckets
syn keyword confLimits max_bucket_bytes max_events_per_bucket truncate_report min_prefix_len
syn keyword confLimits max_results_raw_size cache_ttl min_results_perchunk max_rawsize_perchunk
syn keyword confLimits target_time_perchunk long_search_threshold chunk_multiplier min_freq reduce_freq
syn keyword confLimits reduce_duty_cycle preview_duty_cycle dispatch_quota_retry dispatch_quota_sleep_ms
syn keyword confLimits base_max_searches max_searches_per_cpu max_rt_search_multiplier max_macro_depth
syn keyword confLimits realtime_buffer stack_size status_cache_size timeline_freq preview_freq
syn keyword confLimits max_combiner_memevents replication_period_sec sync_bundle_replication
syn keyword confLimits multi_threaded_setup rr_min_sleep_ms rr_max_sleep_ms rr_sleep_factor
syn keyword confLimits fieldstats_update_freq fieldstats_update_maxperiod remote_timeline
syn keyword confLimits remote_timeline_min_peers remote_timeline_fetchall remote_timeline_thread
syn keyword confLimits remote_timeline_max_count remote_timeline_max_size_mb remote_timeline_touchperiod
syn keyword confLimits remote_timeline_connection_timeout remote_timeline_send_timeout
syn keyword confLimits remote_timeline_receive_timeout default_allow_queue queued_job_check_freq
syn keyword confLimits enable_history max_history_length allow_inexact_metasearch indexed_as_exact_metasearch
syn keyword confLimits dispatch_dir_warning_size allow_reuse track_indextime_range reuse_map_maxsize
syn keyword confLimits use_dispatchtmp_dir status_period_ms search_process_mode fetch_remote_search_log
syn keyword confLimits load_remote_bundles check_splunkd_period queue_size blocking max_blocking_secs
syn keyword confLimits indexfilter default_backfill list_maxsize enforce_time_order disk_usage_update_period
syn keyword confLimits maxclusters sparkline_maxsize maxfiles maxmem_check_freq rdigest_k
syn keyword confLimits rdigest_maxnodes max_stream_window max_valuemap_bytes perc_method approx_dc_threshold
syn keyword confLimits dc_digest_bits natural_sort_output maxKBps threads hot_bucket_min_new_events
syn keyword confLimits sleep_seconds stale_lock_seconds max_summary_ratio max_summary_size max_time
syn keyword confLimits indextime_lag maxopentxn maxopenevents max_fd time_before_close tailing_proc_speed
syn keyword confLimits max_searches_perc auto_summary_perc max_action_results action_execution_threads
syn keyword confLimits actions_queue_size actions_queue_timeout alerts_max_count alerts_expire_period
syn keyword confLimits persistance_period max_lock_files max_lock_file_ttl max_per_result_alerts
syn keyword confLimits max_per_result_alerts_time scheduled_view_timeout cache_timeout
syn keyword confLimits maintenance_period allow_event_summarization max_verify_buckets max_verify_ratio
syn keyword confLimits max_verify_bucket_time verify_delete max_verify_total_time max_run_stats
syn keyword confLimits max_timebefore max_timeafter distributed distributed_search_limit maxcount
syn keyword confLimits use_cache fetch_multiplier cache_ttl_sec min_prefix_length max_concurrent_per_user
syn keyword confLimits maxlen expiration_time maxsamples maxtotalsamples max_inactive lowater_inactive
syn keyword confLimits inactive_eligibility_age_seconds max_users_to_precache allow_multiple_matching_users
syn keyword confLimits extraction_cutoff extract_all rdnsMaxDutyCycle enable_reaper reaper_freq 
syn keyword confLimits reaper_soft_warn_level squashcase keepresults tsidx_init_file_goal_mb
syn keyword confLimits optimize_period optimize_min_src_count optimize_max_size_mb
syn keyword confLimits max_rows_per_table render_endpoint_timeout min_batch_size_bytes default_time_bins
syn keyword confLimits max_id_length replication_file_ttl remote_timeline_prefetch remote_timeline_parallel_fetch
syn keyword confLimits allow_batch_mode batch_search_max_index_values batch_retry_min_interval batch_retry_max_interval
syn keyword confLimits batch_wait_after_end write_multifile_results_out enable_cumulative_quota local_connect_timeout
syn keyword confLimits local_send_timeout local_receive_timeout indexed_realtime_use_by_default indexed_realtime_disk_sync_delay
syn keyword confLimits indexed_realtime_default_span indexed_realtime_maximum_span indexed_realtime_cluster_update_interval
syn keyword confLimits default_partitions partitions_limit return_actions_with_normalized_ids normalized_summaries
syn keyword confLimits detailed_dashboard maxzoomlevel zl_0_gridcell_latspan zl_0_gridcell_longspan filterstrategy
syn keyword confLimits apply_search_filter summariesonly

" macros.conf
"syn keyword confMacrosStanzas
syn keyword confMacros args definition validation errormsg iseval description

" multikv.conf
"syn keyword confMultikvStanzas
syn keyword confMultikv .start .start_offset .member .end .linecount .ignore .replace .tokens _chop_
syn keyword confMultikv _tokenize_ _align_ _token_list_

" outputs.conf
syn keyword confOutputsStanzas contained default tcpout tcpout: tcpout-server: syslog syslog: indexAndForward
syn keyword confOutputs defaultGroup indexAndForward server sendCookedData heartbeatFrequency
syn keyword confOutputs blockOnCloning compressed maxQueueSize dropEventsOnQueueFull dropClonedEventsOnQueueFull
syn keyword confOutputs maxFailuresPerInterval secsInFailureInterval maxConnectionsPerIndexer
syn keyword confOutputs connectionTimeout readTimeout writeTimeout dnsResolutionInterval
syn keyword confOutputs forceTimebasedAutoLB forwardedindex. autoLBFrequency .whitelist .blacklist
syn keyword confOutputs forwardedindex.filter.disable autoLB sslPassword sslCertPath sslRootCAPath
syn keyword confOutputs sslVerifyServerCert sslCommonNameToCheck sslAltNameToCheck useClientSSLCompression
syn keyword confOutputs useACK type priority syslogSourceType timestampformat selectiveIndexing
syn keyword confOutputs masterUri blockWarnThreshold negotiateNewProtocol channelReapInterval channelTTL
syn keyword confOutputs channelReapLowater

" pdf_server.conf
syn keyword confPDFserverStanzas contained settings
syn keyword confPDFserver startwebserver httpport enableSplunkWebSSL privKeyPath caCertPath 
syn keyword confPDFserver supportSSLV3Only root_endpoint static_endpoint static_dir enable_gzip
syn keyword confPDFserver server.thread_pool server.socket_host log.access_file log.error_file
syn keyword confPDFserver log.screen request.show_tracebacks engine.autoreload_on tools.sessions.on
syn keyword confPDFserver tools.sessions.timeout response.timeout tools.sessions.storage_type
syn keyword confPDFserver tools.sessions.storage_path tools.decode.on tools.encode.on tools.encode.encoding
syn keyword confPDFserver pid_path firefox_cmdline max_queue max_concurrent Xvfb xauth mcookie
syn keyword confPDFserver appserver_ipaddr client_ipaddr screenshot_enabled

" procmon-filters.conf
"syn keyword confProcmonFiltersStanzas
syn keyword confProcmonFilters proc type hive

" props.conf
syn keyword confPropsStanzas contained default
syn keyword confProps host source sourcetype CHARSET TRUNCATE LINE_BREAKER LINE_BREAKER_LOOKBEHIND
syn keyword confProps SHOULD_LINEMERGE BREAK_ONLY_BEFORE_DATE BREAK_ONLY_BEFORE MUST_BREAK_AFTER
syn keyword confProps MUST_NOT_BREAK_AFTER MUST_NOT_BREAK_BEFORE MAX_EVENTS DATETIME_CONFIG TIME_PREFIX
syn keyword confProps MAX_TIMESTAMP_LOOKAHEAD TIME_FORMAT TZ MAX_DAYS_AGO MAX_DAYS_HENCE MAX_DIFF_SECS_AGO
syn keyword confProps MAX_DIFF_SECS_HENCE TRANSFORMS- REPORT- EXTRACT- KV_MODE CHECK_FOR_HEADER
syn keyword confProps SEDCMD- LOOKUP- FIELDALIAS- EVAL- NO_BINARY_CHECK SEGMENTATION SEGMENTATION-
syn keyword confProps CHECK_METHOD initCrcLength PREFIX_SOURCETYPE sourcetype rename invalid_cause is_valid
syn keyword confProps unarchive_cmd unarchive_sourcetype LEARN_SOURCETYPE LEARN_MODEL maxDist MORE_THAN
syn keyword confProps LESS_THAN MORE_THAN_ LESS_THAN_ ANNOTATE_PUNCT HEADER_MODE _actions pulldown_type
syn keyword confProps given_type TZ_ALIAS INDEXED_EXTRACTIONS PREAMBLE_REGEX FIELD_HEADER_REGEX HEADER_FIELD_LINE_NUMBER
syn keyword confProps FIELD_DELIMITER FIELD_QUOTE TIMESTAMP_FIELDS FIELD_NAMES detect_trailing_nulls

" pubsub.conf
syn keyword confPubsubStanzas contained default pubsub-server:deploymentServer pubsub-server:
syn keyword confPubsub disabled targetUri
syn keyword confPubsub_Constants direct

" regmon-filters.conf
syn keyword confRegmonFiltersStanzas contained default
syn keyword confRegmonFilters proc hive type baseline baseline_interval disabled index

" restmap.conf
syn keyword confRestmapStanzas contained global script: admin: validation: eai: input: peerupload:
syn keyword confRestmap allowGetAuth pythonHandlerPath match requireAuthentication capability
syn keyword confRestmap scripttype handler xsl script output_modes members handlertype handlerfile
syn keyword confRestmap handleractions showInDirSvc desc dynamic path untar
syn keyword confRestmap capability.post capability.delete capability.get capability.put
syn keyword confRestmap includeInAccessLog

" savedsearches.conf
syn keyword confSavedSearchesStanzas contained default
syn keyword confSavedSearches disabled search enableSched cron_schedule schedule max_concurrent
syn keyword confSavedSearches realtime_schedule counttype relation quantity alert_condition action.
syn keyword confSavedSearches action.email action.email.to action.email.from action.email.subject
syn keyword confSavedSearches action.email.subject action.email.mailserver action.populate_lookup
syn keyword confSavedSearches action.email.inline action.email.sendresults action.email.sendpdf
syn keyword confSavedSearches action.script action.summary_index action.script.filename
syn keyword confSavedSearches action.summary_index._name action.summary_index.inline action.summary_index.
syn keyword confSavedSearches action.summary_index.report_name action.summary_index.report
syn keyword confSavedSearches action.populate_lookup.dest run_on_startup dispatch.ttl dispatch.buckets
syn keyword confSavedSearches dispatch.max_count dispatch.max_time dispatch.lookups dispatch.earliest_time
syn keyword confSavedSearches dispatch.latest_time dispatch.time_format dispatch.spawn_process
syn keyword confSavedSearches dispatch.reduce_freq dispatch.rt_backfill restart_on_searchpeer_add
syn keyword confSavedSearches auto_summarize auto_summarize.command auto_summarize.timespan
syn keyword confSavedSearches auto_summarize.cron_schedule auto_summarize.dispatch.
syn keyword confSavedSearches auto_summarize.suspend_period auto_summarize.max_summary_size
syn keyword confSavedSearches auto_summarize.max_summary_ratio auto_summarize.max_disabled_buckets
syn keyword confSavedSearches auto_summarize.max_time alert.suppress alert.suppress.period
syn keyword confSavedSearches alert.suppress.fields alert.severity alert.expires alert.digest_mode
syn keyword confSavedSearches alert.track displayview vsid is_visible description
syn keyword confSavedSearches request.ui_dispatch_app request.ui_dispatch_view sendresults action_rss
syn keyword confSavedSearches action_email role userid query nextrun qualifiedSearch
syn keyword confSavedSearches action.email.maxresults dispatch.indexedRealtime alert.display_view
syn keyword confSavedSearches display.general.enablePreview display.general.type display.general.timeRangePicker.show display.general.migratedFromViewState
syn keyword confSavedSearches display.events.fields display.events.type display.events.rowNumbers display.events.maxLines display.events.raw.drilldown
syn keyword confSavedSearches display.events.list.drilldown display.events.list.wrap display.events.table.drilldown display.events.table.wrap
syn keyword confSavedSearches display.statistics.rowNumbers display.statistics.wrap display.statistics.overlay display.statistics.drilldown
syn keyword confSavedSearches display.visualizations.show display.visualizations.type display.visualizations.chartHeight 
syn keyword confSavedSearches display.visualizations.charting.chart display.visualizations.charting.chart.stackMode 
syn keyword confSavedSearches display.visualizations.charting.chart.nullValueMode display.visualizations.charting.drilldown
syn keyword confSavedSearches display.visualizations.charting.chart.style display.visualizations.charting.layout.splitSeries
syn keyword confSavedSearches display.visualizations.charting.legend.placement display.visualizations.charting.legend.labelStyle.overflowMode
syn keyword confSavedSearches display.visualizations.charting.axisTitleX.text display.visualizations.charting.axisTitleY.text
syn keyword confSavedSearches display.visualizations.charting.axisTitleX.visibility display.visualizations.charting.axisTitleY.visibility
syn keyword confSavedSearches display.visualizations.charting.axisX.scale display.visualizations.charting.axisY.scale
syn keyword confSavedSearches display.visualizations.charting.axisLabelsX.majorUnit display.visualizations.charting.axisLabelsY.majorUnit
syn keyword confSavedSearches display.visualizations.charting.axisX.minimumNumber display.visualizations.charting.axisY.minimumNumber
syn keyword confSavedSearches display.visualizations.charting.axisX.maximumNumber display.visualizations.charting.axisY.maximumNumber
syn keyword confSavedSearches display.visualizations.charting.chart.sliceCollapsingThreshold display.visualizations.charting.gaugeColors
syn keyword confSavedSearches display.visualizations.charting.chart.rangeValues display.visualizations.singlevalue.beforeLabel
syn keyword confSavedSearches display.visualizations.singlevalue.afterLabel display.visualizations.singlevalue.underLabel 
syn keyword confSavedSearches display.page.search.mode display.page.search.timeline.format display.page.search.timeline.scale
syn keyword confSavedSearches display.page.search.showFields display.page.pivot.dataModel 
syn keyword confSavedSearches_Constants fast smart verbose hidden compact full linear log events statistics visualizations
syn keyword confSavedSearches_Constants heatmap highlow stacked default stacked100 right bottom top left visible collapsed

" searchbnf.conf
syn keyword confSearchbnfStanzas contained default -command
syn keyword confSearchbnf SYNTAX SIMPLESYNTAX ALIAS DESCRIPTION SHORTDESC EXAMPLE COMMENT USAGE TAGS
syn keyword confSearchbnf RELATED maintainer appears-in note supports-multivalue

" segmenters.conf
syn keyword confSegmentersStanzas contained default
syn keyword confSegmenters MAJOR MINOR INTERMEDIATE_MAJORS FILTER LOOKAHEAD MAJOR_LEN MINOR_LEN
syn keyword confSegmenters MAJOR_COUNT MINOR_COUNT

" server.conf
syn keyword confServerStanzas contained default general sslConfig httpServer httpServerListener: mimetype-extension-map
syn keyword confServerStanzas contained applicationsManagement scripts diskUsage queue queue= pubsubsvr-http
syn keyword confServerStanzas contained fileInput diag license lmpool:auto_generated_pool_forwarder
syn keyword confServerStanzas contained lmpool:auto_generated_pool_free lmpool:auto_generated_pool_enterprise
syn keyword confServerStanzas contained lmpool:auto_generated_pool_fixed-sourcetype_ clustermaster:
syn keyword confServerStanzas contained lmpool:auto_generated_pool_download_trial pooling clustering
syn keyword confServerStanzas contained replication_port replication_port-ssl
syn keyword confServer serverName sessionTimeout trustedIP allowRemoteLogin pass4SymmKey listenOnIPv6
syn keyword confServer connectUsingIpVersion guid useHTTPServerCompression useHTTPClientCompression
syn keyword confServer enableSplunkdSSL useSplunkdClientSSLCompression supportSSLV3Only sslVerifyServerCert
syn keyword confServer sslCommonNameToCheck sslAltNameToCheck requireClientCert cipherSuite sslKeysfile
syn keyword confServer sslKeysfilePassword caCertFile caPath certCreateScript atomFeedStylesheet
syn keyword confServer max-age follow-symlinks disableDefaultPort acceptFrom streamInWriteTimeout
syn keyword confServer max_content_length ssl allowInternetAccess url loginUrl detailsUrl useragent
syn keyword confServer updateHost updatePath updateTimeout initialNumberOfScriptProcesses minFreeSpace
syn keyword confServer pollingFrequency pollingTimerFrequency maxSize disabled stateIntervalInSecs
syn keyword confServer outputQueue EXCLUDE- master_uri active_group connection_timeout send_timeout
syn keyword confServer receive_timeout squash_threshold description quota slaves stack_id state storage
syn keyword confServer lock.timeout lock.logging poll.interval.rebuild poll.interval.check poll.blacklist.
syn keyword confServer mode cxn_timeout rcv_timeout rep_cxn_timeout rep_send_timeout rep_rcv_timeout
syn keyword confServer rep_max_send_timeout rep_max_rcv_timeout replication_factor search_factor
syn keyword confServer heartbeat_timeout restart_timeout quiet_period generation_poll_interval
syn keyword confServer max_peer_build_load max_peer_rep_load searchable_targets register_replication_address
syn keyword confServer register_forwarder_address register_search_address heartbeat_period
syn keyword confServer defaultHTTPServerCompressionLevel skipHTTPCompressAcl sslCommonNameList sendStrictTransportSecurityHeader
syn keyword confServer allowSslCompression allowSslRenegotiation maxThreads maxSockets forceHttp10 crossOriginSharingPolicy
syn keyword confServer x_fram_options_sameorigin cliLoginBanner allowBasicAuth basicAuthRealm cntr_1_lookback_time
syn keyword confServer cntr_2_lookback_time cntr_3_lookback_time sampling_interval app_update_triggers search_files_retry_timeout
syn keyword confServer max_replication_errors target_wait_time commit_retry_time percent_peers_to_restart executor_workers
syn keyword confServer_Constants always never requireSetPassword KB MB GB self Enterprise Trial Forwarder Free
syn keyword confServer_Constants master slave searchhead enabled clustermaster: silence

" serverclass.conf
syn keyword confServerClassStanzas contained global serverClass:
syn keyword confServerClass repositoryLocation targetRepositoryLocation tmpFolder continueMatching
syn keyword confServerClass endpoint filterType machineTypes machineTypesFilter whitelist. blacklist.
syn keyword confServerClass restartSplunkWeb restartSplunkd stateOnClient appFile
syn match confServerClassMatch "\(white\|black\)list\.\d\+"

" source-classifier.conf
"syn keyword confSourceClassStanzas
syn keyword confSourceClass ignored_model_keywords ignored_filename_keywords

" sourcetypes.conf
syn keyword confSourceTypesStanzas contained default
syn keyword confSourceTypes _sourcetype _source

" splunk-launch.conf
"syn keyword confSplunkLaunchStanzas
syn keyword confSplunkLaunch SPLUNK_HOME SPLUNK_DB SPLUNK_BINDIP SPLUNK_IGNORE_SELINUX SPLUNK_SERVER_NAME
syn keyword confSplunkLaunch SPLUNK_WEB_NAME

"" tags.conf
"syn keyword confTagsStanzas
"syn keyword confTags

" tenants.conf
syn keyword confTenantsStanzas contained default tenant:
syn keyword confTenants filterType whitelist. blacklist. phoneHomeTopic

" times.conf
syn keyword confTimesStanzas contained default
syn keyword confTimes label header_label earliest_time latest_time order sub_menu is_sub_menu

" transactiontypes.conf
syn keyword confTransactionTypesStanzas contained default
syn keyword confTransactionTypes maxspan maxpause maxevents fields startswith endswith connected maxopentxn
syn keyword confTransactionTypes maxopenevents keepevicted mvlist delim nullstr search

" transforms.conf
syn keyword confTransformsStanzas contained default
syn keyword confTransforms REGEX FORMAT LOOKAHEAD WRITE_META DEST_KEY DEFAULT_VALUE SOURCE_KEY
syn keyword confTransforms REPEAT_MATCH DELIMS FIELDS MV_ADD CLEAN_KEYS KEEP_EMPTY_VALS CAN_OPTIMIZE
syn keyword confTransforms filename max_matches min_matches default_match case_sensitive_match
syn keyword confTransforms match_type external_cmd fields_list external_type time_field time_format
syn keyword confTransforms max_offset_secs min_offset_secs batch_index_query allow_caching
syn keyword confTransforms_Constants _raw _done _meta _time MetaData:FinalType MetaData:Host queue
syn keyword confTransforms_Constants _MetaData:Index MetaData:Source MetaData:Sourcetype

" ui-prefs.conf
syn keyword confUIPrefsStanzas contained default
syn keyword confUIPrefs dispatch.earliest_time dispatch.latest_time display.prefs.autoOpenSearchAssistant display.prefs.timeline.height 
syn keyword confUIPrefs display.prefs.timeline.minimized display.prefs.timeline.minimalMode display.prefs.aclFilter display.prefs.searchContext 
syn keyword confUIPrefs display.prefs.events.count display.prefs.statistics.count display.prefs.fieldCoverage display.general.enablePreview 
syn keyword confUIPrefs display.events.fields display.events.type display.events.rowNumbers display.events.maxLines display.events.raw.drilldown 
syn keyword confUIPrefs display.events.list.drilldown display.events.list.wrap display.events.table.drilldown display.events.table.wrap 
syn keyword confUIPrefs display.statistics.rowNumbers display.statistics.wrap display.statistics.drilldown display.visualizations.type 
syn keyword confUIPrefs display.visualizations.chartHeight display.visualizations.charting.chart display.visualizations.charting.chart.style 
syn keyword confUIPrefs display.visualizations.charting.legend.labelStyle.overflowMode display.page.search.mode display.page.search.timeline.format 
syn keyword confUIPrefs display.page.search.timeline.scale display.page.search.showFields 
syn keyword confUIPrefs_Constants none app owner raw list table inner outer full row cell charting singlevalue line area column bar pie scatter
syn keyword confUIPrefs_Constants radialGauge fillerGauge markerGauge minimal shiny ellipsisEnd ellipsisMiddle ellipsisStart fast smart verbose
syn keyword confUIPrefs_Constants hidden compact full linear log

" user-seed.conf
syn keyword confUserSeedStanzas contained user_info
syn keyword confUserSeed USERNAME PASSWORD

" viewstates.conf
syn keyword confViewStatesStanzas contained default
"syn keyword confViewStates

" web.conf
syn keyword confWebStanzas contained settings endpoint:
syn keyword confWeb startwebserver httpport mgmtHostPort enableSplunkWebSSL privKeyPath caCertPath
syn keyword confWeb serviceFormPostURL userRegistrationURL updateCheckerBaseURL docsCheckerBaseURL
syn keyword confWeb enable_insecure_login login_content supportSSLV3Only cipherSuite root_endpoint
syn keyword confWeb static_endpoint static_dir rss_endpoint tools.staticdir.generate_indexes
syn keyword confWeb template_dir module_dir enable_gzip use_future_expires flash_major_version
syn keyword confWeb flash_minor_version flash_revision_version enable_proxy_write js_logger_mode
syn keyword confWeb js_logger_mode_server_end_point js_logger_mode_server_poll_buffer 
syn keyword confWeb js_logger_mode_server_max_buffer ui_inactivity_timeout js_no_cache
syn keyword confWeb enable_autocomplete_login minify_js minify_css trap_module_exceptions
syn keyword confWeb jschart_test_mode max_view_cache_size version_label_format remoteUser SSOMode
syn keyword confWeb trustedIP testing_endpoint testing_dir server.thread_pool server.thread_pool_max
syn keyword confWeb server.thread_pool_min_spare server.thread_pool_max_spare server.socket_host
syn keyword confWeb listenOnIPv6 max_upload_size log.access_maxsize log.access_maxfiles
syn keyword confWeb log.error_maxsize log.error_maxfiles log.screen request.show_tracebacks
syn keyword confWeb engine.autoreload_on tools.session.on tools.sessions.timeout 
syn keyword confWeb tools.sessions.restart_persist tools.sessions.httponly tools.sessions.secure
syn keyword confWeb response.timeout tools.sessions.storage_type tools.sessions.storage_path
syn keyword confWeb tools.decode.on tools.encode.on tools.encode.encoding tools.proxy.on pid_path
syn keyword confWeb enabled_decomposers trustedIP remoteUser SSOMode
syn keyword confWeb splunkConnectionTimeout simple_xml_force_flash_charting pdfgen_is_available auto_refresh_views
syn keyword confWeb x_frame_options_sameorigin simple_xml_module_render simple_xml_perf_debug django_enable
syn keyword confWeb django_path django_force_enable
syn keyword confWeb_Constants None Firebug Server permissive strict no yes only

" wmi.conf
syn keyword confWmiStanzas contained settings WMI:
syn keyword confWmi initial_backoff max_backoff max_retries_at_max_backoff checkpoint_sync_interval
syn keyword confWmi server interval disabled hostname current_only index event_log_file
syn keyword confWmi disable_hostname_normalization wql namespace

" workflow_actions.conf
syn keyword confWorkflowActionsStanzas contained default
syn keyword confWorkflowActions type label fields eventtypes display_location disabled link.uri
syn keyword confWorkflowActions link.target link.method link.postargs. search.search_string search.app
syn keyword confWorkflowActions search.view search.target search.earliest search.latest
syn keyword confWorkflowActions search.preserve_timerange


" Highlight definitions (generic)
hi def link confComment Comment
hi def link confSpecComment Comment
hi def link confBoolean Boolean
hi def link confTodo Todo

hi def link confStanzaStart Preproc
hi def link confstanzaEnd Preproc

" Highlight for stanzas
hi def link confStanza Function
hi def link confInputsStanzas Type

" Other highlights
hi def link confString String

" Highlight definitions (by .conf)
hi def link confADmon Keyword
hi def link confAlertActions Keyword
hi def link confApp Keyword
hi def link confAudit Keyword
hi def link confAuthentication Keyword
hi def link confAuthorize Keyword
hi def link confCommands Keyword
hi def link confCrawl Keyword
hi def link confDataModels Keyword
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
hi def link confMacros Keyword
hi def link confMultikv Keyword
hi def link confOutputs Keyword
hi def link confPDFserver Keyword
hi def link confProcmonFilters Keyword
hi def link confProps Keyword
hi def link confPubsub Keyword
hi def link confPubsub_Constants Constant
hi def link confRegmonFilters Keyword
hi def link confRestmap Keyword
hi def link confSavedSearches Keyword
hi def link confSavedSearches_Constants Constant
hi def link confSearchbnf Keyword
hi def link confSegmenters Keyword
hi def link confServer Keyword
hi def link confServer_Constants Constant
hi def link confServerClass Keyword
hi def link confServerClassMatch Keyword
hi def link confSourceClass Keyword
hi def link confSourceTypes Keyword
hi def link confSplunkLaunch Keyword
hi def link confTags Keyword
hi def link confTenants Keyword
hi def link confTimes Keyword
hi def link confTransactionTypes Keyword
hi def link confTransforms Keyword
hi def link confTransforms_Constants Constant
hi def link confUIPrefs Keyword
hi def link confUIPrefs_Constants Constant
hi def link confUserSeed Keyword
hi def link confViewStates Keyword
hi def link confWeb Keyword
hi def link confWeb_Constants Constant
hi def link confWmi Keyword
hi def link confWorkflowActions Keyword
