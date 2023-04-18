```python
{
  # 永久生效配置
  "persistent" : {
    "action" : {
      "destructive_requires_name" : "false"
    },
    "cluster" : {
      "routing" : {
        "allocation" : {
          "node_concurrent_incoming_recoveries" : "2",
          "node_concurrent_recoveries" : "2",
          "node_initial_primaries_recoveries" : "4",
          "node_concurrent_outgoing_recoveries" : "2"
        }
      },
      "metadata" : {
        "async_write" : {
          "enable" : "false"
        },
        "master_async_write" : {
          "enable" : "false"
        }
      }
    },
    "indices" : {
      "recovery" : {
        "max_bytes_per_sec" : "40mb" # 集群恢复时每秒最大处理量
      }
    },
    "logger" : {
      "org" : "info"
    }
  },
  "transient" : {
    "action" : {
      "destructive_requires_name" : "false"
    },
    "cluster" : {
      "routing" : {
        "allocation" : {
          "node_concurrent_incoming_recoveries" : "2",
          "node_concurrent_recoveries" : "2",
          "node_initial_primaries_recoveries" : "4",
          "node_concurrent_outgoing_recoveries" : "2"
        }
      },
      "metadata" : {
        "async_write" : {
          "enable" : "false"
        },
        "master_async_write" : {
          "enable" : "false"
        }
      }
    },
    "indices" : {
      "recovery" : {
        "max_bytes_per_sec" : "40mb"
      }
    },
    "logger" : {
      "org" : "info"
    }
  },
  "defaults" : {
    "cluster" : {
      "routing" : {
        "use_adaptive_replica_selection" : "false",
        "rebalance" : {
          "enable" : "all"
        },
        "allocation" : {
          "multi_path_relocation_balance" : {
            "enable" : "true"
          },
          "same_shard" : {
            "host" : "false"
          },
          "total_shards_per_node" : "-1",
          "multi_path_relocation" : {
            "max_factor" : "2"
          },
          "delay_allocate" : {
            "enable" : "true"
          },
          "shard_state" : {
            "started" : {
              "priority" : "URGENT"
            },
            "failed" : {
              "priority" : "URGENT"
            }
          },
          "type" : "balanced",
          "random_path_allocate" : {
            "enable" : "true"
          },
          "disk" : {
            "threshold_enabled" : "true",
            "watermark" : {
              "low" : "85%",
              "flood_stage" : "95%",
              "high" : "90%"
            },
            "include_relocations" : "true",
            "reroute_interval" : "60s"
          },
          "awareness" : {
            "attributes" : [
              "ip"
            ]
          },
          "balance" : {
            "index" : "0.55",
            "threshold" : "1.0",
            "shard" : "0.45"
          },
          "random_allocate" : {
            "enable" : "true"
          },
          "enable" : "all",
          "same_ip_relocate" : {
            "enable" : "false"
          },
          "allow_rebalance" : "indices_all_active",
          "cluster_concurrent_rebalance" : "2"
        }
      },
      "indices" : {
        "tombstones" : {
          "size" : "500"
        },
        "close" : {
          "enable" : "true"
        }
      },
      "nodes" : {
        "reconnect_interval" : "10s"
      },
      "persistent_tasks" : {
        "allocation" : {
          "enable" : "all",
          "recheck_interval" : "30s"
        }
      },
      "auth" : {
        "extra" : {
          "permission" : ""
        }
      },
      "blocks" : {
        "read_only_allow_delete" : "false",
        "read_only" : "false"
      },
      "service" : {
        "slow_task_logging_threshold" : "30s"
      },
      "name" : "es-1a35xrhw",
      "max_shards_per_node" : "1000",
      "remote" : {
        "node" : {
          "attr" : ""
        },
        "initial_connect_timeout" : "30s",
        "connect" : "true",
        "connections_per_cluster" : "3"
      },
      "info" : {
        "update" : {
          "interval" : "30s",
          "timeout" : "15s"
        }
      }
    },
    "chunk_size" : "1gb",
    "auth" : "",
    "end_point" : "",
    "logger" : {
      "level" : "INFO"
    },
    "cluster_type" : "clog",
    "processors" : "16",
    "ingest" : {
      "geoip" : {
        "cache_size" : "1000"
      },
      "grok" : {
        "watchdog" : {
          "max_execution_time" : "1s",
          "interval" : "1s"
        }
      }
    },
    "pidfile" : "",
    "path" : {
      "data" : [
        "/data1/containers/1656662142001104232/es/data"
      ],
      "logs" : "/data1/containers/1656662142001104232/es/logs",
      "shared_data" : "",
      "home" : "/data1/containers/1656662142001104232/es",
      "repo" : [ ]
    },
    "ccr" : {
      "wait_for_metadata_timeout" : "60s",
      "indices" : {
        "recovery" : {
          "recovery_activity_timeout" : "60s",
          "chunk_size" : "1mb",
          "internal_action_timeout" : "60s",
          "max_bytes_per_sec" : "40mb",
          "max_concurrent_file_chunks" : "5"
        }
      },
      "auto_follow" : {
        "wait_for_metadata_timeout" : "60s"
      }
    },
    "scheduler_period_min" : "30",
    "repositories" : {
      "fs" : {
        "compress" : "false",
        "chunk_size" : "9223372036854775807b",
        "location" : ""
      },
      "url" : {
        "supported_protocols" : [
          "http",
          "https",
          "ftp",
          "file",
          "jar"
        ],
        "allowed_urls" : [ ],
        "url" : "http:"
      }
    },
    "action" : {
      "auto_create_index" : "true",
      "search" : {
        "shard_count" : {
          "limit" : "9223372036854775807"
        }
      },
      "master" : {
        "force_local" : "false"
      }
    },
    "app_id" : "",
    "cache" : {
      "recycler" : {
        "page" : {
          "limit" : {
            "heap" : "10%"
          },
          "type" : "CONCURRENT",
          "weight" : {
            "longs" : "1.0",
            "ints" : "1.0",
            "bytes" : "1.0",
            "objects" : "0.1"
          }
        }
      }
    },
    "reindex" : {
      "remote" : {
        "whitelist" : [ ]
      }
    },
    "compress" : "false",
    "resource" : {
      "reload" : {
        "enabled" : "true",
        "interval" : {
          "low" : "60s",
          "high" : "5s",
          "medium" : "30s"
        }
      }
    },
    "thread_pool" : {
      "force_merge" : {
        "queue_size" : "-1",
        "size" : "1"
      },
      "fetch_shard_started" : {
        "core" : "1",
        "max" : "32",
        "keep_alive" : "5m"
      },
      "listener" : {
        "queue_size" : "-1",
        "size" : "8"
      },
      "index" : {
        "queue_size" : "200",
        "size" : "16"
      },
      "refresh" : {
        "core" : "1",
        "max" : "8",
        "keep_alive" : "5m"
      },
      "generic" : {
        "core" : "4",
        "max" : "128",
        "keep_alive" : "30s"
      },
      "warmer" : {
        "core" : "1",
        "max" : "5",
        "keep_alive" : "5m"
      },
      "search" : {
        "max_queue_size" : "1000",
        "queue_size" : "1000",
        "size" : "25",
        "auto_queue_frame_size" : "2000",
        "target_response_time" : "1s",
        "min_queue_size" : "1000"
      },
      "fetch_shard_store" : {
        "core" : "1",
        "max" : "32",
        "keep_alive" : "5m"
      },
      "flush" : {
        "core" : "1",
        "max" : "5",
        "keep_alive" : "5m"
      },
      "management" : {
        "core" : "1",
        "max" : "5",
        "keep_alive" : "5m"
      },
      "analyze" : {
        "queue_size" : "16",
        "size" : "1"
      },
      "get" : {
        "queue_size" : "1000",
        "size" : "16"
      },
      "bulk" : {
        "queue_size" : "200",
        "size" : "16"
      },
      "estimated_time_interval" : "200ms",
      "write" : {
        "queue_size" : "1024",
        "size" : "16"
      },
      "snapshot" : {
        "core" : "1",
        "max" : "5",
        "keep_alive" : "5m"
      },
      "search_throttled" : {
        "max_queue_size" : "100",
        "queue_size" : "100",
        "size" : "1",
        "auto_queue_frame_size" : "200",
        "target_response_time" : "1s",
        "min_queue_size" : "100"
      }
    },
    "index" : {
      "codec" : "default",
      "store" : {
        "hybrid" : {
          "extension" : [
            "nvd",
            "dvd",
            "tim",
            "cfs"
          ]
        },
        "type" : "",
        "fs" : {
          "fs_lock" : "native"
        },
        "preload" : [ ]
      }
    },
    "indices_expire" : {
      "disable" : "false"
    },
    "script" : {
      "allowed_contexts" : [ ],
      "max_compilations_rate" : "75/5m",
      "cache" : {
        "max_size" : "100",
        "expire" : "0ms"
      },
      "painless" : {
        "regex" : {
          "enabled" : "false"
        }
      },
      "max_size_in_bytes" : "65535",
      "allowed_types" : [ ]
    },
    "auth_version" : "0",
    "bucket" : "",
    "node" : {
      "data" : "true",
      "enable_lucene_segment_infos_trace" : "false",
      "local_storage" : "true",
      "max_local_storage_nodes" : "1",
      "name" : "1656662142001104232",
      "id" : {
        "seed" : "0"
      },
      "store" : {
        "allow_mmap" : "true",
        "allow_mmapfs" : "true"
      },
      "attr" : {
        "rack" : "cvm_4_200005",
        "set" : "200005",
        "ip" : "9.20.83.249",
        "temperature" : "hot",
        "region" : "4",
        "xpack" : {
          "installed" : "true"
        },
        "ml" : {
          "machine_memory" : "67211829248",
          "max_open_jobs" : "20",
          "enabled" : "true"
        }
      },
      "portsfile" : "false",
      "ingest" : "true",
      "master" : "true",
      "ml" : "true"
    },
    "max_running_jobs" : "20",
    "tribe" : {
      "name" : "",
      "on_conflict" : "any",
      "blocks" : {
        "metadata" : "false",
        "read" : {
          "indices" : [ ]
        },
        "write.indices" : [ ],
        "write" : "false",
        "metadata.indices" : [ ]
      }
    },
    "http" : {
      "cors" : {
        "max-age" : "1728000",
        "allow-origin" : "",
        "allow-headers" : "X-Requested-With,Content-Type,Content-Length",
        "allow-credentials" : "false",
        "allow-methods" : "OPTIONS,HEAD,GET,POST,PUT,DELETE",
        "enabled" : "false"
      },
      "max_chunk_size" : "8kb",
      "compression_level" : "3",
      "max_initial_line_length" : "4kb",
      "type" : "security4",
      "pipelining" : "true",
      "enabled" : "true",
      "type.default" : "netty4",
      "content_type" : {
        "required" : "true"
      },
      "host" : [ ],
      "publish_port" : "-1",
      "read_timeout" : "0ms",
      "max_content_length" : "100mb",
      "netty" : {
        "receive_predictor_size" : "64kb",
        "max_composite_buffer_components" : "69905",
        "receive_predictor_max" : "64kb",
        "worker_count" : "32",
        "receive_predictor_min" : "64kb"
      },
      "tcp" : {
        "reuse_address" : "true",
        "keep_alive" : "true",
        "receive_buffer_size" : "-1b",
        "no_delay" : "true",
        "send_buffer_size" : "-1b"
      },
      "bind_host" : [ ],
      "reset_cookies" : "false",
      "max_warning_header_count" : "-1",
      "max_warning_header_size" : "-1b",
      "detailed_errors" : {
        "enabled" : "true"
      },
      "port" : "9200",
      "max_header_size" : "8kb",
      "pipelining.max_events" : "10000",
      "tcp_no_delay" : "true",
      "compression" : "true",
      "publish_host" : [ ]
    },
    "region" : "",
    "access_key_id" : "",
    "no" : {
      "model" : {
        "state" : {
          "persist" : "false"
        }
      }
    },
    "bootstrap" : {
      "memory_lock" : "false",
      "system_call_filter" : "false",
      "ctrlhandler" : "true"
    },
    "network" : {
      "host" : [
        "0.0.0.0"
      ],
      "tcp" : {
        "reuse_address" : "true",
        "keep_alive" : "true",
        "connect_timeout" : "30s",
        "receive_buffer_size" : "-1b",
        "no_delay" : "true",
        "send_buffer_size" : "-1b"
      },
      "bind_host" : [
        "0.0.0.0"
      ],
      "server" : "true",
      "breaker" : {
        "inflight_requests" : {
          "limit" : "100%",
          "overhead" : "1.0"
        }
      },
      "publish_host" : [
        "9.20.83.249"
      ]
    },
    "pre-create_index" : {
      "reserved_hours" : "2",
      "enable" : "true",
      "inherit_metric" : {
        "enable" : "false"
      }
    },
    "search" : {
      "default_search_timeout" : "30000ms",
      "check_buckets_step_size" : "1024",
      "max_open_scroll_context" : "2147483647",
      "max_buckets" : "-1",
      "composite_aggregation" : {
        "early_terminal_enabled" : "true",
        "seek_after_enabled" : "true"
      },
      "simplify_search_results" : "false",
      "keep_alive_interval" : "1m",
      "remote" : {
        "node" : {
          "attr" : ""
        },
        "initial_connect_timeout" : "30s",
        "connect" : "true",
        "connections_per_cluster" : "3"
      },
      "max_keep_alive" : "24h",
      "composite_aggregations" : {
        "use_global_ordinal" : "true"
      },
      "highlight" : {
        "term_vector_multi_value" : "true"
      },
      "default_allow_partial_results" : "true",
      "low_level_cancellation" : "false",
      "simplify_aggregation_results" : "false",
      "default_search_rpc_timeout" : "30000ms",
      "bucket_expansion_ratio" : "10",
      "allow_parent_breaker_partial_results" : "false",
      "default_keep_alive" : "5m"
    },
    "security" : {
      "manager" : {
        "filter_bad_defaults" : "true"
      }
    },
    "root" : {
      "routing" : {
        "rebalance" : {
          "enable" : "ALL"
        }
      }
    },
    "client" : {
      "type" : "node",
      "transport" : {
        "ignore_cluster_name" : "false",
        "nodes_sampler_interval" : "5s",
        "sniff" : "false",
        "ping_timeout" : "5s"
      }
    },
    "table_version" : "0",
    "table" : "",
    "xpack" : {
      "watcher" : {
        "execution" : {
          "scroll" : {
            "size" : "0",
            "timeout" : ""
          },
          "default_throttle_period" : "5s"
        },
        "internal" : {
          "ops" : {
            "bulk" : {
              "default_timeout" : ""
            },
            "index" : {
              "default_timeout" : ""
            },
            "search" : {
              "default_timeout" : ""
            }
          }
        },
        "thread_pool" : {
          "queue_size" : "1000",
          "size" : "50"
        },
        "index" : {
          "rest" : {
            "direct_access" : ""
          }
        },
        "history" : {
          "cleaner_service" : {
            "enabled" : "true"
          }
        },
        "trigger" : {
          "schedule" : {
            "ticker" : {
              "tick_interval" : "500ms"
            }
          }
        },
        "enabled" : "true",
        "input" : {
          "search" : {
            "default_timeout" : ""
          }
        },
        "encrypt_sensitive_data" : "false",
        "transform" : {
          "search" : {
            "default_timeout" : ""
          }
        },
        "stop" : {
          "timeout" : "30s"
        },
        "watch" : {
          "scroll" : {
            "size" : "0"
          }
        },
        "require_manual_start" : "false",
        "bulk" : {
          "concurrent_requests" : "0",
          "flush_interval" : "1s",
          "size" : "1mb",
          "actions" : "1"
        },
        "actions" : {
          "bulk" : {
            "default_timeout" : ""
          },
          "index" : {
            "default_timeout" : ""
          }
        }
      },
      "ilm" : {
        "enabled" : "true"
      },
      "monitoring" : {
        "collection" : {
          "cluster" : {
            "stats" : {
              "timeout" : "10s"
            }
          },
          "node" : {
            "stats" : {
              "timeout" : "10s"
            }
          },
          "indices" : [ ],
          "ccr" : {
            "stats" : {
              "timeout" : "10s"
            }
          },
          "index" : {
            "stats" : {
              "timeout" : "10s"
            },
            "recovery" : {
              "active_only" : "false",
              "timeout" : "10s"
            }
          },
          "interval" : "60s",
          "enabled" : "true",
          "ml" : {
            "job" : {
              "stats" : {
                "timeout" : "10s"
              }
            }
          }
        },
        "history" : {
          "duration" : "168h"
        },
        "elasticsearch" : {
          "collection" : {
            "enabled" : "true"
          }
        },
        "enabled" : "true"
      },
      "graph" : {
        "enabled" : "true"
      },
      "rollup" : {
        "enabled" : "true",
        "task_thread_pool" : {
          "queue_size" : "4",
          "size" : "4"
        }
      },
      "sql" : {
        "enabled" : "true"
      },
      "license" : {
        "self_generated" : {
          "type" : "basic"
        }
      },
      "logstash" : {
        "enabled" : "true"
      },
      "notification" : {
        "hipchat" : {
          "host" : "",
          "port" : "443",
          "default_account" : ""
        },
        "pagerduty" : {
          "default_account" : ""
        },
        "email" : {
          "default_account" : "",
          "html" : {
            "sanitization" : {
              "allow" : [
                "body",
                "head",
                "_tables",
                "_links",
                "_blocks",
                "_formatting",
                "img:embedded"
              ],
              "disallow" : [ ],
              "enabled" : "true"
            }
          }
        },
        "reporting" : {
          "retries" : "40",
          "interval" : "15s"
        },
        "jira" : {
          "default_account" : ""
        },
        "slack" : {
          "default_account" : ""
        }
      },
      "security" : {
        "dls_fls" : {
          "enabled" : "true"
        },
        "transport" : {
          "filter" : {
            "allow" : [ ],
            "deny" : [ ],
            "enabled" : "true"
          },
          "ssl" : {
            "enabled" : "true"
          }
        },
        "enabled" : "true",
        "filter" : {
          "always_allow_bound_address" : "true"
        },
        "encryption" : {
          "algorithm" : "AES/CTR/NoPadding"
        },
        "audit" : {
          "outputs" : [
            "logfile"
          ],
          "index" : {
            "bulk_size" : "1000",
            "rollover" : "DAILY",
            "flush_interval" : "1s",
            "events" : {
              "emit_request_body" : "false",
              "include" : [
                "ACCESS_DENIED",
                "ACCESS_GRANTED",
                "ANONYMOUS_ACCESS_DENIED",
                "AUTHENTICATION_FAILED",
                "REALM_AUTHENTICATION_FAILED",
                "CONNECTION_DENIED",
                "CONNECTION_GRANTED",
                "TAMPERED_REQUEST",
                "RUN_AS_DENIED",
                "RUN_AS_GRANTED",
                "AUTHENTICATION_SUCCESS"
              ],
              "exclude" : [ ]
            },
            "queue_max_size" : "10000"
          },
          "enabled" : "false",
          "logfile" : {
            "emit_node_id" : "true",
            "emit_node_host_name" : "false",
            "emit_node_name" : "true",
            "events" : {
              "emit_request_body" : "false",
              "include" : [
                "ACCESS_DENIED",
                "ACCESS_GRANTED",
                "ANONYMOUS_ACCESS_DENIED",
                "AUTHENTICATION_FAILED",
                "CONNECTION_DENIED",
                "TAMPERED_REQUEST",
                "RUN_AS_DENIED",
                "RUN_AS_GRANTED"
              ],
              "exclude" : [ ]
            },
            "prefix" : {
              "emit_node_host_name" : "false",
              "emit_node_name" : "true",
              "emit_node_host_address" : "false"
            },
            "emit_node_host_address" : "false"
          }
        },
        "authc" : {
          "password_hashing" : {
            "algorithm" : "bcrypt"
          },
          "success_cache" : {
            "size" : "10000",
            "enabled" : "false",
            "expire_after_access" : "1h"
          },
          "api_key" : {
            "cache" : {
              "hash_algo" : "ssha256",
              "max_keys" : "10000",
              "ttl" : "24h"
            },
            "delete" : {
              "interval" : "24h",
              "timeout" : "-1"
            },
            "enabled" : "false",
            "hashing" : {
              "algorithm" : "pbkdf2"
            }
          },
          "anonymous" : {
            "authz_exception" : "true",
            "roles" : [ ],
            "username" : "_anonymous"
          },
          "run_as" : {
            "enabled" : "true"
          },
          "reserved_realm" : {
            "enabled" : "false"
          },
          "token" : {
            "compat" : {
              "enabled" : "false"
            },
            "delete" : {
              "interval" : "30m",
              "timeout" : "-1"
            },
            "enabled" : "false",
            "thread_pool" : {
              "queue_size" : "1000",
              "size" : "1"
            },
            "timeout" : "20m"
          }
        },
        "fips_mode" : {
          "enabled" : "false"
        },
        "encryption_key" : {
          "length" : "128",
          "algorithm" : "AES"
        },
        "http" : {
          "filter" : {
            "allow" : [ ],
            "deny" : [ ],
            "enabled" : "true"
          },
          "ssl" : {
            "enabled" : "false"
          }
        },
        "automata" : {
          "max_determinized_states" : "100000",
          "cache" : {
            "size" : "10000",
            "ttl" : "48h",
            "enabled" : "true"
          }
        },
        "user" : null,
        "authz" : {
          "store" : {
            "roles" : {
              "index" : {
                "cache" : {
                  "ttl" : "20m",
                  "max_size" : "10000"
                }
              },
              "auth_indices_cache" : {
                "enable" : "true"
              },
              "cache" : {
                "max_size" : "10000"
              },
              "negative_lookup_cache" : {
                "max_size" : "10000"
              },
              "max_auth_indices_cache_count" : "10000",
              "field_permissions" : {
                "cache" : {
                  "max_size_in_bytes" : "104857600"
                }
              }
            }
          }
        }
      },
      "ccr" : {
        "enabled" : "true",
        "ccr_thread_pool" : {
          "queue_size" : "100",
          "size" : "32"
        }
      },
      "http" : {
        "default_connection_timeout" : "10s",
        "proxy" : {
          "host" : "",
          "scheme" : "",
          "port" : "0"
        },
        "default_read_timeout" : "10s",
        "max_response_size" : "10mb"
      },
      "ml" : {
        "utility_thread_pool" : {
          "queue_size" : "500",
          "size" : "80"
        },
        "max_anomaly_records" : "500",
        "enable_config_migration" : "true",
        "max_open_jobs" : "20",
        "min_disk_space_off_heap" : "5gb",
        "node_concurrent_job_allocations" : "2",
        "max_model_memory_limit" : "0b",
        "enabled" : "true",
        "max_lazy_ml_nodes" : "0",
        "max_machine_memory_percent" : "30",
        "autodetect_process" : "true",
        "datafeed_thread_pool" : {
          "queue_size" : "200",
          "size" : "20"
        },
        "process_connect_timeout" : "10s",
        "autodetect_thread_pool" : {
          "queue_size" : "80",
          "size" : "80"
        }
      }
    },
    "auth.disable" : "true",
    "netty" : {
      "breaker" : {
        "limit" : "95%",
        "type" : "memory",
        "enabled" : "true",
        "timeout" : "30000ms"
      }
    },
    "rest" : {
      "action" : {
        "multi" : {
          "allow_explicit_index" : "true"
        }
      }
    },
    "max" : {
      "anomaly" : {
        "records" : "500"
      }
    },
    "base_path" : "",
    "monitor" : {
      "jvm" : {
        "gc" : {
          "enabled" : "true",
          "overhead" : {
            "warn" : "50",
            "debug" : "10",
            "info" : "25"
          },
          "refresh_interval" : "1s"
        },
        "refresh_interval" : "1s"
      },
      "process" : {
        "refresh_interval" : "1s"
      },
      "os" : {
        "refresh_interval" : "1s"
      },
      "fs" : {
        "refresh_interval" : "1s"
      }
    },
    "transport" : {
      "tcp" : {
        "reuse_address" : "true",
        "connect_timeout" : "30s",
        "compress" : "false",
        "port" : "9300",
        "no_delay" : "true",
        "keep_alive" : "true",
        "receive_buffer_size" : "-1b",
        "send_buffer_size" : "-1b"
      },
      "bind_host" : [ ],
      "connect_timeout" : "30s",
      "compress" : "false",
      "ping_schedule" : "-1",
      "connections_per_node" : {
        "recovery" : "2",
        "state" : "1",
        "bulk" : "3",
        "reg" : "6",
        "ping" : "1"
      },
      "tracer" : {
        "include" : [ ],
        "exclude" : [
          "internal:discovery/zen/fd*",
          "cluster:monitor/nodes/liveness"
        ]
      },
      "type" : "security4",
      "type.default" : "netty4",
      "features" : {
        "x-pack" : "true"
      },
      "port" : "9300",
      "host" : [ ],
      "publish_port" : "-1",
      "connection" : {
        "max_corrupted_msg_bytes" : "512"
      },
      "tcp_no_delay" : "true",
      "publish_host" : [ ],
      "netty" : {
        "receive_predictor_size" : "64kb",
        "receive_predictor_max" : "64kb",
        "worker_count" : "32",
        "receive_predictor_min" : "64kb",
        "boss_count" : "1"
      }
    },
    "preferred_master_name" : "",
    "indices" : {
      "cache" : {
        "cleanup_interval" : "1m"
      },
      "mapping" : {
        "dynamic_timeout" : "30s",
        "put" : {
          "priority" : "URGENT"
        },
        "max_in_flight_updates" : "10"
      },
      "memory" : {
        "interval" : "5s",
        "max_index_buffer_size" : "-1",
        "shard_inactive_time" : "5m",
        "index_buffer_size" : "15%",
        "min_index_buffer_size" : "48mb"
      },
      "breaker" : {
        "request" : {
          "limit" : "60%",
          "type" : "memory",
          "overhead" : "1.0"
        },
        "search" : {
          "throttle" : "90%"
        },
        "total" : {
          "limit" : "90%",
          "use_real_memory" : "true"
        },
        "fielddata" : {
          "limit" : "20%",
          "type" : "memory",
          "overhead" : "1.03"
        },
        "single_request" : {
          "limit" : "20%",
          "type" : "memory",
          "overhead" : "1.0"
        },
        "accounting" : {
          "limit" : "100%",
          "overhead" : "1.0"
        },
        "bulk" : {
          "throttle" : "90%"
        },
        "type" : "hierarchy"
      },
      "segment_memory" : {
        "off_heap" : {
          "segment_count" : "1",
          "min_size" : "500mb",
          "size" : "500mb",
          "enable" : "false",
          "max_size" : "32gb",
          "min_value_size" : "512"
        }
      },
      "query" : {
        "bool" : {
          "max_clause_count" : "1024"
        },
        "query_string" : {
          "analyze_wildcard" : "false",
          "allowLeadingWildcard" : "true"
        }
      },
      "admin" : {
        "filtered_fields" : "true"
      },
      "allow_multi_types" : "false",
      "recovery" : {
        "recovery_activity_timeout" : "1800000ms",
        "retry_delay_network" : "5s",
        "internal_action_timeout" : "15m",
        "retry_delay_state_sync" : "500ms",
        "internal_action_long_timeout" : "1800000ms",
        "max_concurrent_file_chunks" : "1"
      },
      "requests" : {
        "cache" : {
          "size" : "1%",
          "expire" : "0ms"
        }
      },
      "store" : {
        "delete" : {
          "shard" : {
            "timeout" : "30s"
          }
        }
      },
      "analysis" : {
        "hunspell" : {
          "dictionary" : {
            "ignore_case" : "false",
            "lazy" : "false"
          }
        }
      },
      "queries" : {
        "cache" : {
          "count" : "300",
          "max_times_of_leading_cost" : "250",
          "size" : "5%",
          "all_segments" : "false",
          "max_doc_count" : "5000000"
        }
      },
      "lifecycle" : {
        "poll_interval" : "10m"
      },
      "fielddata" : {
        "cache" : {
          "size" : "15%"
        }
      },
      "bulk" : {
        "reject_illegal_time_data" : {
          "enable" : "true"
        }
      }
    },
    "plugin" : {
      "mandatory" : [ ]
    },
    "metric" : {
      "create_deduplicate_optimize" : {
        "enable" : "true"
      }
    },
    "discovery" : {
      "type" : "zen",
      "zen" : {
        "commit_timeout" : "30s",
        "no_master_block" : "write",
        "join_retry_delay" : "100ms",
        "join_retry_attempts" : "3",
        "ping" : {
          "unicast" : {
            "concurrent_connects" : "10",
            "hosts" : [
              "9.20.83.249:9300",
              "9.20.85.27:9300",
              "9.20.91.71:9300",
              "9.20.86.14:9300"
            ],
            "hosts.resolve_timeout" : "5s"
          }
        },
        "master_election" : {
          "ignore_non_master_pings" : "false",
          "wait_for_joins_timeout" : "30000ms"
        },
        "send_leave_request" : "true",
        "ping_timeout" : "3s",
        "join_timeout" : "60000ms",
        "publish_diff" : {
          "enable" : "true"
        },
        "publish" : {
          "max_pending_cluster_states" : "25"
        },
        "minimum_master_nodes" : "3",
        "hosts_provider" : [ ],
        "publish_timeout" : "30s",
        "fd" : {
          "connect_on_network_disconnect" : "false",
          "ping_interval" : "1s",
          "ping_retries" : "3",
          "register_connection_listener" : "true",
          "ping_timeout" : "30s"
        },
        "max_pings_from_another_master" : "3"
      },
      "initial_state_timeout" : "30s"
    },
    "access_key_secret" : "",
    "gateway" : {
      "recover_after_master_nodes" : "0",
      "expected_nodes" : "-1",
      "recover_after_data_nodes" : "-1",
      "expected_data_nodes" : "-1",
      "recover_after_time" : "0ms",
      "expected_master_nodes" : "-1",
      "recover_after_nodes" : "-1"
    }
  }
}

```

```

```

