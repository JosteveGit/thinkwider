#include "httpd.h"
#include "http_protocol.h"
#include "ap_config.h"

extern const char* helloWorld();

static int hello_handler(request_rec *r) {
    if (!r->handler || strcmp(r->handler, "hello") != 0) {
        return DECLINED;
    }

    ap_set_content_type(r, "text/html;charset=ascii");
    ap_rputs(helloWorld(), r);
    return OK;
}

static void register_hooks(apr_pool_t *p) {
    ap_hook_handler(hello_handler, NULL, NULL, APR_HOOK_MIDDLE);
}

module AP_MODULE_DECLARE_DATA hello_module = {
    STANDARD20_MODULE_STUFF,
    NULL,
    NULL,
    NULL,
    NULL,
    NULL,
    register_hooks
};