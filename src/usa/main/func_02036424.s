; func_02036424 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_0219b264
        .extern func_020361fc
        .global func_02036424
        .arm
func_02036424:
    stmdb sp!, {r4, r5, r6, lr}
    ldr r4, _LIT0
    mov r6, r0
    mov r5, #0x0
.L_1d4:
    ldr r0, [r4, r5, lsl #0x2]
    cmp r0, #0x0
    beq .L_200
    ldrsb r1, [r0, #0x6a]
    cmp r1, #0x0
    blt .L_200
    ldrh r1, [r0, #0x68]
    tst r1, #0x200
    beq .L_200
    mov r1, r6
    bl func_020361fc
.L_200:
    add r5, r5, #0x1
    cmp r5, #0x4
    blt .L_1d4
    ldmia sp!, {r4, r5, r6, pc}
_LIT0: .word data_0219b264
