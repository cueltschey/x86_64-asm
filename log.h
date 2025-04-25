#ifndef LOG_H
#define LOG_H

typedef enum log_level_e { ERROR = 0, WARNING, INFO, DEBUG } log_level_t;

extern log_level_t log_level;

#define ASM_ERROR(msg, ...)                                                    \
  do {                                                                         \
    if (log_level >= ERROR)                                                    \
      fprintf(stderr, "[ERROR] " msg "\n", ##__VA_ARGS__);                     \
  } while (0)

#define ASM_WARN(msg, ...)                                                     \
  do {                                                                         \
    if (log_level >= WARNING)                                                  \
      fprintf(stderr, "[WARN ] " msg "\n", ##__VA_ARGS__);                     \
  } while (0)

#define ASM_INFO(msg, ...)                                                     \
  do {                                                                         \
    if (log_level >= INFO)                                                     \
      fprintf(stderr, "[INFO ] " msg "\n", ##__VA_ARGS__);                     \
  } while (0)

#define ASM_DEBUG(msg, ...)                                                    \
  do {                                                                         \
    if (log_level >= DEBUG)                                                    \
      fprintf(stderr, "[DEBUG] " msg "\n", ##__VA_ARGS__);                     \
  } while (0)

#endif
