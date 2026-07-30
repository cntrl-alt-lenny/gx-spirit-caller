/* data_ov004_0220a2f8 (8 bytes, 4-aligned): wave 14 string retype.
 * Already-matched, byte-verified consumer func_ov004_021dbd08 (a real
 * strlen: `for (i=0; s[i]!=0; i++) {} return i;`) is called directly on
 * this symbol in func_ov004_021dd27c.thumb.c (Net_SerializeParams),
 * with a max-length-8 bounded copy in every other call site -- the
 * strongest evidence tier this campaign uses. Pairs with sibling
 * data_ov004_0220a300 ("ESSID-AOSS") as an AOSS Wi-Fi default name/key.
 * A prior survey doc's "Category 6... writable void* singleton"
 * cluster-level guess does not hold for this symbol (real string, not
 * a pointer) -- corrected by direct consumer evidence, same pattern as
 * wave 13's veneer-blob doc corrections. 5 printable ASCII + 3 trailing
 * NUL, byte-exact per script re-extraction. Plain char, no
 * const/unsigned (.data ground truth).
 */

char data_ov004_0220a2f8[8] = "MELCO";
