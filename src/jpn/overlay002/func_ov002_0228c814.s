; func_ov002_0228c814 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_ov002_022cf08c
        .extern data_ov002_022cf098
        .global func_ov002_0228c814
        .arm
func_ov002_0228c814:
    stmdb sp!, {r3, r4, r5, r6, r7, r8, r9, sl, fp, lr}
    mov sl, r0
    ldr r0, _LIT0
    and r4, sl, #0x1
    mul r3, r4, r0
    ldr r0, _LIT1
    mov r6, #0x0
    ldr r0, [r0, r3]
    mov r9, r1
    mov r8, r2
    mov r4, r6
    cmp r0, #0x0
    mvn r5, #0x0
    bls .L_144
    ldr r0, _LIT2
    mov fp, #0xb
    add r7, r0, r3
.L_104:
    mov r0, sl
    mov r1, fp
    mov r2, r4
    blx r9
    cmp r0, #0x0
    beq .L_134
    mov r0, sl
    mov r1, r4
    blx r8
    cmp r0, r6
    movgt r6, r0
    movgt r5, r4
.L_134:
    ldr r0, [r7, #0xc]
    add r4, r4, #0x1
    cmp r4, r0
    bcc .L_104
.L_144:
    mov r0, r5
    ldmia sp!, {r3, r4, r5, r6, r7, r8, r9, sl, fp, pc}
_LIT0: .word 0x00000868
_LIT1: .word data_ov002_022cf098
_LIT2: .word data_ov002_022cf08c
