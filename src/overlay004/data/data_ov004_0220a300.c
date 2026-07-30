/* data_ov004_0220a300 (12 bytes, 4-aligned): wave 14 string retype.
 * Already-matched func_ov004_021dd27c.thumb.c (Net_SerializeParams,
 * which already forward-declares this as `extern char[]`, not
 * unsigned) calls verified strlen/memcpy-equivalents on this symbol;
 * func_ov004_021dd2c8.s independently calls verified
 * strlen/memcmp-equivalents on it too, inside a per-slot
 * name-matching loop. Pairs with sibling data_ov004_0220a2f8 ("MELCO")
 * as the AOSS Wi-Fi default SSID/key pair. A prior survey doc's
 * "Category 6... writable void* singleton" cluster guess does not hold
 * here either (real string) -- same correction as sibling 0220a2f8.
 * 10 printable ASCII + 2 trailing NUL, byte-exact per script
 * re-extraction. Plain char, no const/unsigned (.data ground truth,
 * and matches the existing extern declaration's type exactly).
 */

char data_ov004_0220a300[12] = "ESSID-AOSS";
