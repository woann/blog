package redis

import (
	"fmt"
	"github.com/garyburd/redigo/redis"
	"time"
)
var redisPool *redis.Pool

const (
	RedisURL            = "127.0.0.1:6379"
	redisMaxIdle        = 100   //最大空闲连接数
	redisIdleTimeoutSec = 300 //最大空闲连接时间
	RedisPassword       = "wqg951122"
)
// NewRedisPool 返回redis连接池
func init() {
	redisPool = &redis.Pool{
		MaxIdle:     redisMaxIdle,
		IdleTimeout: redisIdleTimeoutSec * time.Second,
		Dial: func() (redis.Conn, error) {
			c, err := redis.Dial("tcp", RedisURL)
			fmt.Println(err)
			if err != nil {
				return nil, fmt.Errorf("redis connection error: %s", err)
			}
			//验证redis密码
			if _, authErr := c.Do("AUTH", RedisPassword); authErr != nil {
				return nil, fmt.Errorf("redis auth password error: %s", authErr)
			}
			return c, err
		},
		TestOnBorrow: func(c redis.Conn, t time.Time) error {
			_, err := c.Do("PING")
			if err != nil {
				return fmt.Errorf("ping redis error: %s", err)
			}
			return nil
		},
	}
}

func Set(key,val string) error{
	conn := redisPool.Get()
	defer conn.Close()
	_, err := conn.Do("SET", key, val)
	return err
}

func Get(key string) string {
	conn := redisPool.Get()
	defer conn.Close()
	res, _ := redis.String(conn.Do("GET", key))
	return res
}

func SAdd(key,val string) error {
	conn := redisPool.Get()
	defer conn.Close()
	_, err := conn.Do("SADD", key, val)
	return err
}
func SIsMember(key,val string) bool {
	conn := redisPool.Get()
	defer conn.Close()
	res, _ := redis.Bool(conn.Do("SISMEMBER", key, val))
	return res
}

func IsExist(key string) bool {
	conn := redisPool.Get()
	v, err := redis.Bool(conn.Do("EXISTS", key))
	if err != nil {
		return false
	}
	return v
}