if !has('python3')
    echo "Error: Required vim compiled with +python3"
    finish
endif

function! SqlHamalFun(l1, l2)

python3 << EOF

import vim
import re

keywords = ['ACCESSIBLE'
,'ACCOUNT'
,'ACTION'
,'ACTIVE'
,'ADD'
,'ADMIN'
,'AFTER'
,'AGAINST'
,'AGGREGATE'
,'ALGORITHM'
,'ALL'
,'ALTER'
,'ALWAYS'
,'ANALYSE'
,'ANALYZE'
,'AND'
,'ANY'
,'ARRAY'
,'AS'
,'ASC'
,'ASCII'
,'ASENSITIVE'
,'AT'
,'ATTRIBUTE'
,'AUTOEXTEND_SIZE'
,'AUTO_INCREMENT'
,'AVG'
,'AVG_ROW_LENGTH'
,'BACKUP'
,'BEFORE'
,'BEGIN'
,'BETWEEN'
,'BIGINT'
,'BINARY'
,'BINLOG'
,'BIT'
,'BLOB'
,'BLOCK'
,'BOOL'
,'BOOLEAN'
,'BOTH'
,'BTREE'
,'BUCKETS'
,'BY'
,'BYTE'
,'CACHE'
,'CALL'
,'CASCADE'
,'CASCADED'
,'CASE'
,'CATALOG_NAME'
,'CHAIN'
,'CHANGE'
,'CHANGED'
,'CHANNEL'
,'CHAR'
,'CHARACTER'
,'CHARSET'
,'CHECK'
,'CHECKSUM'
,'CIPHER'
,'CLASS_ORIGIN'
,'CLIENT'
,'CLONE'
,'CLOSE'
,'COALESCE'
,'CODE'
,'COLLATE'
,'COLLATION'
,'COLUMN'
,'COLUMNS'
,'COLUMN_FORMAT'
,'COLUMN_NAME'
,'COMMENT'
,'COMMIT'
,'COMMITTED'
,'COMPACT'
,'COMPLETION'
,'COMPONENT'
,'COMPRESSED'
,'COMPRESSION'
,'CONCURRENT'
,'CONDITION'
,'CONNECTION'
,'CONSISTENT'
,'CONSTRAINT'
,'CONSTRAINT_CATALOG'
,'CONSTRAINT_NAME'
,'CONSTRAINT_SCHEMA'
,'CONTAINS'
,'CONTEXT'
,'CONTINUE'
,'CONVERT'
,'CPU'
,'CREATE'
,'CROSS'
,'CUBE'
,'CUME_DIST'
,'CURRENT'
,'CURRENT_DATE'
,'CURRENT_TIME'
,'CURRENT_TIMESTAMP'
,'CURRENT_USER'
,'CURSOR'
,'CURSOR_NAME'
,'DATA'
,'DATABASE'
,'DATABASES'
,'DATAFILE'
,'DATE'
,'DATETIME'
,'DAY'
,'DAY_HOUR'
,'DAY_MICROSECOND'
,'DAY_MINUTE'
,'DAY_SECOND'
,'DEALLOCATE'
,'DEC'
,'DECIMAL'
,'DECLARE'
,'DEFAULT'
,'DEFAULT_AUTH'
,'DEFINER'
,'DEFINITION'
,'DELAYED'
,'DELAY_KEY_WRITE'
,'DELETE'
,'DENSE_RANK'
,'DESC'
,'DESCRIBE'
,'DESCRIPTION'
,'DES_KEY_FILE'
,'DETERMINISTIC'
,'DIAGNOSTICS'
,'DIRECTORY'
,'DISABLE'
,'DISCARD'
,'DISK'
,'DISTINCT'
,'DISTINCTROW'
,'DIV'
,'DO'
,'DOUBLE'
,'DROP'
,'DUAL'
,'DUMPFILE'
,'DUPLICATE'
,'DYNAMIC'
,'EACH'
,'ELSE'
,'ELSEIF'
,'EMPTY'
,'ENABLE'
,'ENCLOSED'
,'ENCRYPTION'
,'END'
,'ENDS'
,'ENFORCED'
,'ENGINE'
,'ENGINES'
,'ENGINE_ATTRIBUTE'
,'ENUM'
,'ERROR'
,'ERRORS'
,'ESCAPE'
,'ESCAPED'
,'EVENT'
,'EVENTS'
,'EVERY'
,'EXCEPT'
,'EXCHANGE'
,'EXCLUDE'
,'EXECUTE'
,'EXISTS'
,'EXIT'
,'EXPANSION'
,'EXPIRE'
,'EXPLAIN'
,'EXPORT'
,'EXTENDED'
,'EXTENT_SIZE'
,'FAILED_LOGIN_ATTEMPTS'
,'FALSE'
,'FAST'
,'FAULTS'
,'FETCH'
,'FIELDS'
,'FILE'
,'FILE_BLOCK_SIZE'
,'FILTER'
,'FIRST'
,'FIRST_VALUE'
,'FIXED'
,'FLOAT'
,'FLOAT4'
,'FLOAT8'
,'FLUSH'
,'FOLLOWING'
,'FOLLOWS'
,'FOR'
,'FORCE'
,'FOREIGN'
,'FORMAT'
,'FOUND'
,'FROM'
,'FULL'
,'FULLTEXT'
,'FUNCTION'
,'GENERAL'
,'GENERATED'
,'GEOMCOLLECTION'
,'GEOMETRY'
,'GEOMETRYCOLLECTION'
,'GET'
,'GET_FORMAT'
,'GET_MASTER_PUBLIC_KEY'
,'GET_SOURCE_PUBLIC_KEY'
,'GLOBAL'
,'GRANT'
,'GRANTS'
,'GROUP'
,'GROUPING'
,'GROUPS'
,'GROUP_REPLICATION'
,'HANDLER'
,'HASH'
,'HAVING'
,'HELP'
,'HIGH_PRIORITY'
,'HISTOGRAM'
,'HISTORY'
,'HOST'
,'HOSTS'
,'HOUR'
,'HOUR_MICROSECOND'
,'HOUR_MINUTE'
,'HOUR_SECOND'
,'IDENTIFIED'
,'IF'
,'IGNORE'
,'IGNORE_SERVER_IDS'
,'IMPORT'
,'IN'
,'INACTIVE'
,'INDEX'
,'INDEXES'
,'INFILE'
,'INITIAL_SIZE'
,'INNER'
,'INOUT'
,'INSENSITIVE'
,'INSERT'
,'INSERT_METHOD'
,'INSTALL'
,'INSTANCE'
,'INT'
,'INT1'
,'INT2'
,'INT3'
,'INT4'
,'INT8'
,'INTEGER'
,'INTERVAL'
,'INTO'
,'INVISIBLE'
,'INVOKER'
,'IO'
,'IO_AFTER_GTIDS'
,'IO_BEFORE_GTIDS'
,'IO_THREAD'
,'IPC'
,'IS'
,'ISOLATION'
,'ISSUER'
,'ITERATE'
,'JOIN'
,'JSON'
,'JSON_TABLE'
,'JSON_VALUE'
,'KEY'
,'KEYRING'
,'KEYS'
,'KEY_BLOCK_SIZE'
,'KILL'
,'LAG'
,'LANGUAGE'
,'LAST'
,'LAST_VALUE'
,'LATERAL'
,'LEAD'
,'LEADING'
,'LEAVE'
,'LEAVES'
,'LEFT'
,'LESS'
,'LEVEL'
,'LIKE'
,'LIMIT'
,'LINEAR'
,'LINES'
,'LINESTRING'
,'LIST'
,'LOAD'
,'LOCAL'
,'LOCALTIME'
,'LOCALTIMESTAMP'
,'LOCK'
,'LOCKED'
,'LOCKS'
,'LOGFILE'
,'LOGS'
,'LONG'
,'LONGBLOB'
,'LONGTEXT'
,'LOOP'
,'LOW_PRIORITY'
,'MASTER'
,'MASTER_AUTO_POSITION'
,'MASTER_BIND'
,'MASTER_COMPRESSION_ALGORITHMS'
,'MASTER_CONNECT_RETRY'
,'MASTER_DELAY'
,'MASTER_HEARTBEAT_PERIOD'
,'MASTER_HOST'
,'MASTER_LOG_FILE'
,'MASTER_LOG_POS'
,'MASTER_PASSWORD'
,'MASTER_PORT'
,'MASTER_PUBLIC_KEY_PATH'
,'MASTER_RETRY_COUNT'
,'MASTER_SERVER_ID'
,'MASTER_SSL'
,'MASTER_SSL_CA'
,'MASTER_SSL_CAPATH'
,'MASTER_SSL_CERT'
,'MASTER_SSL_CIPHER'
,'MASTER_SSL_CRL'
,'MASTER_SSL_CRLPATH'
,'MASTER_SSL_KEY'
,'MASTER_SSL_VERIFY_SERVER_CERT'
,'MASTER_TLS_CIPHERSUITES'
,'MASTER_TLS_VERSION'
,'MASTER_USER'
,'MASTER_ZSTD_COMPRESSION_LEVEL'
,'MATCH'
,'MAXVALUE'
,'MAX_CONNECTIONS_PER_HOUR'
,'MAX_QUERIES_PER_HOUR'
,'MAX_ROWS'
,'MAX_SIZE'
,'MAX_UPDATES_PER_HOUR'
,'MAX_USER_CONNECTIONS'
,'MEDIUM'
,'MEDIUMBLOB'
,'MEDIUMINT'
,'MEDIUMTEXT'
,'MEMBER'
,'MEMORY'
,'MERGE'
,'MESSAGE_TEXT'
,'MICROSECOND'
,'MIDDLEINT'
,'MIGRATE'
,'MINUTE'
,'MINUTE_MICROSECOND'
,'MINUTE_SECOND'
,'MIN_ROWS'
,'MOD'
,'MODE'
,'MODIFIES'
,'MODIFY'
,'MONTH'
,'MULTILINESTRING'
,'MULTIPOINT'
,'MULTIPOLYGON'
,'MUTEX'
,'MYSQL_ERRNO'
,'NAME'
,'NAMES'
,'NATIONAL'
,'NATURAL'
,'NCHAR'
,'NDB'
,'NDBCLUSTER'
,'NESTED'
,'NETWORK_NAMESPACE'
,'NEVER'
,'NEW'
,'NEXT'
,'NO'
,'NODEGROUP'
,'NONE'
,'NOT'
,'NOWAIT'
,'NO_WAIT'
,'NO_WRITE_TO_BINLOG'
,'NTH_VALUE'
,'NTILE'
,'NULL'
,'NULLS'
,'NUMBER'
,'NUMERIC'
,'NVARCHAR'
,'OF'
,'OFF'
,'OFFSET'
,'OJ'
,'OLD'
,'ON'
,'ONE'
,'ONLY'
,'OPEN'
,'OPTIMIZE'
,'OPTIMIZER_COSTS'
,'OPTION'
,'OPTIONAL'
,'OPTIONALLY'
,'OPTIONS'
,'OR'
,'ORDER'
,'ORDINALITY'
,'ORGANIZATION'
,'OTHERS'
,'OUT'
,'OUTER'
,'OUTFILE'
,'OVER'
,'OWNER'
,'PACK_KEYS'
,'PAGE'
,'PARSER'
,'PARTIAL'
,'PARTITION'
,'PARTITIONING'
,'PARTITIONS'
,'PASSWORD'
,'PASSWORD_LOCK_TIME'
,'PATH'
,'PERCENT_RANK'
,'PERSIST'
,'PERSIST_ONLY'
,'PHASE'
,'PLUGIN'
,'PLUGINS'
,'PLUGIN_DIR'
,'POINT'
,'POLYGON'
,'PORT'
,'PRECEDES'
,'PRECEDING'
,'PRECISION'
,'PREPARE'
,'PRESERVE'
,'PREV'
,'PRIMARY'
,'PRIVILEGES'
,'PRIVILEGE_CHECKS_USER'
,'PROCEDURE'
,'PROCESS'
,'PROCESSLIST'
,'PROFILE'
,'PROFILES'
,'PROXY'
,'PURGE'
,'QUARTER'
,'QUERY'
,'QUICK'
,'RANDOM'
,'RANGE'
,'RANK'
,'READ'
,'READS'
,'READ_ONLY'
,'READ_WRITE'
,'REAL'
,'REBUILD'
,'RECOVER'
,'RECURSIVE'
,'REDOFILE'
,'REDO_BUFFER_SIZE'
,'REDUNDANT'
,'REFERENCE'
,'REFERENCES'
,'REGEXP'
,'RELAY'
,'RELAYLOG'
,'RELAY_LOG_FILE'
,'RELAY_LOG_POS'
,'RELAY_THREAD'
,'RELEASE'
,'RELOAD'
,'REMOTE'
,'REMOVE'
,'RENAME'
,'REORGANIZE'
,'REPAIR'
,'REPEAT'
,'REPEATABLE'
,'REPLACE'
,'REPLICA'
,'REPLICAS'
,'REPLICATE_DO_DB'
,'REPLICATE_DO_TABLE'
,'REPLICATE_IGNORE_DB'
,'REPLICATE_IGNORE_TABLE'
,'REPLICATE_REWRITE_DB'
,'REPLICATE_WILD_DO_TABLE'
,'REPLICATE_WILD_IGNORE_TABLE'
,'REPLICATION'
,'REQUIRE'
,'REQUIRE_ROW_FORMAT'
,'RESET'
,'RESIGNAL'
,'RESOURCE'
,'RESPECT'
,'RESTART'
,'RESTORE'
,'RESTRICT'
,'RESUME'
,'RETAIN'
,'RETURN'
,'RETURNED_SQLSTATE'
,'RETURNING'
,'RETURNS'
,'REUSE'
,'REVERSE'
,'REVOKE'
,'RIGHT'
,'RLIKE'
,'ROLE'
,'ROLLBACK'
,'ROLLUP'
,'ROTATE'
,'ROUTINE'
,'ROW'
,'ROWS'
,'ROW_COUNT'
,'ROW_FORMAT'
,'ROW_NUMBER'
,'RTREE'
,'SAVEPOINT'
,'SCHEDULE'
,'SCHEMA'
,'SCHEMAS'
,'SCHEMA_NAME'
,'SECOND'
,'SECONDARY'
,'SECONDARY_ENGINE'
,'SECONDARY_ENGINE_ATTRIBUTE'
,'SECONDARY_LOAD'
,'SECONDARY_UNLOAD'
,'SECOND_MICROSECOND'
,'SECURITY'
,'SELECT'
,'SENSITIVE'
,'SEPARATOR'
,'SERIAL'
,'SERIALIZABLE'
,'SERVER'
,'SESSION'
,'SET'
,'SHARE'
,'SHOW'
,'SHUTDOWN'
,'SIGNAL'
,'SIGNED'
,'SIMPLE'
,'SKIP'
,'SLAVE'
,'SLOW'
,'SMALLINT'
,'SNAPSHOT'
,'SOCKET'
,'SOME'
,'SONAME'
,'SOUNDS'
,'SOURCE'
,'SOURCE_AUTO_POSITION'
,'SOURCE_BIND'
,'SOURCE_COMPRESSION_ALGORITHMS'
,'SOURCE_CONNECT_RETRY'
,'SOURCE_DELAY'
,'SOURCE_HEARTBEAT_PERIOD'
,'SOURCE_HOST'
,'SOURCE_LOG_FILE'
,'SOURCE_LOG_POS'
,'SOURCE_PASSWORD'
,'SOURCE_PORT'
,'SOURCE_PUBLIC_KEY_PATH'
,'SOURCE_RETRY_COUNT'
,'SOURCE_SSL'
,'SOURCE_SSL_CA'
,'SOURCE_SSL_CAPATH'
,'SOURCE_SSL_CERT'
,'SOURCE_SSL_CIPHER'
,'SOURCE_SSL_CRL'
,'SOURCE_SSL_CRLPATH'
,'SOURCE_SSL_KEY'
,'SOURCE_SSL_VERIFY_SERVER_CERT'
,'SOURCE_TLS_CIPHERSUITES'
,'SOURCE_TLS_VERSION'
,'SOURCE_USER'
,'SOURCE_ZSTD_COMPRESSION_LEVEL'
,'SPATIAL'
,'SPECIFIC'
,'SQL'
,'SQLEXCEPTION'
,'SQLSTATE'
,'SQLWARNING'
,'SQL_AFTER_GTIDS'
,'SQL_AFTER_MTS_GAPS'
,'SQL_BEFORE_GTIDS'
,'SQL_BIG_RESULT'
,'SQL_BUFFER_RESULT'
,'SQL_CACHE'
,'SQL_CALC_FOUND_ROWS'
,'SQL_NO_CACHE'
,'SQL_SMALL_RESULT'
,'SQL_THREAD'
,'SQL_TSI_DAY'
,'SQL_TSI_HOUR'
,'SQL_TSI_MINUTE'
,'SQL_TSI_MONTH'
,'SQL_TSI_QUARTER'
,'SQL_TSI_SECOND'
,'SQL_TSI_WEEK'
,'SQL_TSI_YEAR'
,'SRID'
,'SSL'
,'STACKED'
,'START'
,'STARTING'
,'STARTS'
,'STATS_AUTO_RECALC'
,'STATS_PERSISTENT'
,'STATS_SAMPLE_PAGES'
,'STATUS'
,'STOP'
,'STORAGE'
,'STORED'
,'STRAIGHT_JOIN'
,'STREAM'
,'STRING'
,'SUBCLASS_ORIGIN'
,'SUBJECT'
,'SUBPARTITION'
,'SUBPARTITIONS'
,'SUPER'
,'SUSPEND'
,'SWAPS'
,'SWITCHES'
,'SYSTEM'
,'TABLE'
,'TABLES'
,'TABLESPACE'
,'TABLE_CHECKSUM'
,'TABLE_NAME'
,'TEMPORARY'
,'TEMPTABLE'
,'TERMINATED'
,'TEXT'
,'THAN'
,'THEN'
,'THREAD_PRIORITY'
,'TIES'
,'TIME'
,'TIMESTAMP'
,'TIMESTAMPADD'
,'TIMESTAMPDIFF'
,'TINYBLOB'
,'TINYINT'
,'TINYTEXT'
,'TLS'
,'TO'
,'TRAILING'
,'TRANSACTION'
,'TRIGGER'
,'TRIGGERS'
,'TRUE'
,'TRUNCATE'
,'TYPE'
,'TYPES'
,'UNBOUNDED'
,'UNCOMMITTED'
,'UNDEFINED'
,'UNDO'
,'UNDOFILE'
,'UNDO_BUFFER_SIZE'
,'UNICODE'
,'UNINSTALL'
,'UNION'
,'UNIQUE'
,'UNKNOWN'
,'UNLOCK'
,'UNSIGNED'
,'UNTIL'
,'UPDATE'
,'UPGRADE'
,'USAGE'
,'USE'
,'USER'
,'USER_RESOURCES'
,'USE_FRM'
,'USING'
,'UTC_DATE'
,'UTC_TIME'
,'UTC_TIMESTAMP'
,'VALIDATION'
,'VALUE'
,'VALUES'
,'VARBINARY'
,'VARCHAR'
,'VARCHARACTER'
,'VARIABLES'
,'VARYING'
,'VCPU'
,'VIEW'
,'VIRTUAL'
,'VISIBLE'
,'WAIT'
,'WARNINGS'
,'WEEK'
,'WEIGHT_STRING'
,'WHEN'
,'WHERE'
,'WHILE'
,'WINDOW'
,'WITH'
,'WITHOUT'
,'WORK'
,'WRAPPER'
,'WRITE'
,'X509'
,'XA'
,'XID'
,'XML'
,'XOR'
,'YEAR'
,'YEAR_MONTH'
,'ZEROFILL'
,'ZONE'
]

def update(lines):
    result = []
    for line in visualLines:
        for match in re.finditer(r'[a-zA-Z_]+',line):
            start = match.start()
            end = match.end()
            word = line[start:end]
            if word.upper() in keywords:
                line = line.replace(word,word.upper())
        result.append(line)
    return result


line1 = int(vim.eval("a:l1"))
line2 = int(vim.eval("a:l2"))

cb = vim.current.buffer

visualLines = cb[line1-1:line2]
lines = update(visualLines)
cb[line1 - 1 : line2] = lines;

EOF

endfunction

com! -range=% -nargs=0 SqlHamal call SqlHamalFun(<line1>, <line2>)
