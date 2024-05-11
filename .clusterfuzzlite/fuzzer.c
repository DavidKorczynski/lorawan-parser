#include <string.h>
#include <stdint.h>
#include <stddef.h>
#include "json.h"

int LLVMFuzzerTestOneInput(const uint8_t *data, size_t size) {
    if (size == 0)
        return 0;

    // Ensure `data` is null-terminated
    char input[size + 1];
    memcpy(input, data, size);
    input[size] = '\0';

    // Call the target function with the input
    JsonNode *result = json_decode((const char *)input);

    // Free the result to avoid memory leaks
    json_delete(result);

    return 0;
}
  
