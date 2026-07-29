/* data_ov004_02209ac0 (20 bytes, 4-aligned): wave 14 function-pointer
 * table retype. Already has a real, in-tree C consumer proving the
 * exact shape: src/overlay004/func_ov004_021cb518.c indexes this array
 * by a runtime counter (data_021040ac.fb6c), calls the entry if
 * non-NULL, and treats a NULL slot as sequence-end -- a step/state-
 * machine dispatch table. relocs.txt: 4 outgoing pointer relocs at
 * offsets 0/4/8/0xc to real (still-unmatched) ARM functions
 * func_ov004_021cab44/_021caedc/_021cb060/_021cb290, offset 0x10 has no
 * reloc (plain NULL terminator) -- matches the consumer's own logic
 * exactly. void* literal casts (not named refs), matching this
 * project's established pointer-table convention (data_ov022_021ab9a0,
 * data_ov004_0220a2a0) regardless of section. Non-const (.data ground
 * truth, delinks.txt).
 */

typedef void *Ov004StepFn;

Ov004StepFn data_ov004_02209ac0[5] = {
    (Ov004StepFn)0x021cab44,
    (Ov004StepFn)0x021caedc,
    (Ov004StepFn)0x021cb060,
    (Ov004StepFn)0x021cb290,
    0,
};
