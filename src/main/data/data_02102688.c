/* Cluster B pointer singleton brief 148 — code-pointer slot.
 *
 * data_02102688 holds a 4-byte pointer to func_02099928 (an arm-
 * mode function). Same recipe shape as the data-pointer slots,
 * with `extern char func_X;` substituted for the function
 * forward-declaration — mwldarm doesn't enforce function-vs-
 * data type agreement across TUs as long as the symbol resolves.
 * Per brief 121, thumb-mode targets would need `+1` on the
 * address; this target is ARM (per the kind:function(arm,...)
 * entry in symbols.txt), so no offset adjustment is required.
 */

extern char func_02099928;

void *data_02102688 = &func_02099928;
