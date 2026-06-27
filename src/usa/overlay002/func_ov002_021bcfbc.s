; func_ov002_021bcfbc — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern func_ov002_021baf88
        .extern func_ov002_021bbdcc
        .extern func_ov002_021bcf04
        .global func_ov002_021bcfbc
        .arm
func_ov002_021bcfbc:
    stmdb sp!, {r4, r5, r6, lr}
    mov r6, r0
    mov r5, #0x0
    mov r4, #0x5
.L_10:
    mov r0, r6
    mov r1, r4
    bl func_ov002_021bcf04
    cmp r0, #0x0
    add r4, r4, #0x1
    addne r5, r5, #0x1
    cmp r4, #0xa
    blt .L_10
    ldr r0, _LIT0
    bl func_ov002_021baf88
    cmp r0, #0x0
    beq .L_68
    mov r0, r6
    bl func_ov002_021bbdcc
    rsb r0, r0, #0x5
    cmp r5, r0
    blt .L_60
    mov r0, r6
    bl func_ov002_021bbdcc
    rsb r5, r0, #0x5
.L_60:
    cmp r5, #0x0
    movle r5, #0x0
.L_68:
    mov r0, r5
    ldmia sp!, {r4, r5, r6, pc}
_LIT0: .word 0x000016df
