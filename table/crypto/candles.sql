CREATE DATABASE IF NOT EXISTS crypto;

DROP TABLE IF EXISTS crypto.candles;

CREATE TABLE crypto.candles
(
    exchange String,           -- 交易所名称（如 binance）
    symbol String,             -- 币对（如 BTC/USDT）
    interval String,           -- K线周期（如 1m, 5m）
    open_time DateTime,        -- 开始时间
    end_time DateTime,         -- 结束时间
    open Float64,              -- 开盘价
    high Float64,              -- 最高价
    low Float64,               -- 最低价
    close Float64,             -- 收盘价
    volume Float64,            -- 成交量
    quote_volume Float64,      -- 成交额
    trades UInt64,             -- 成交笔数
    buy_volume Float64,        -- 主动买入量
    buy_quote_volume Float64   -- 主动买入额
)

ENGINE = MergeTree
PARTITION BY toYYYYMMDD(open_time)
ORDER BY (symbol, interval, open_time);
