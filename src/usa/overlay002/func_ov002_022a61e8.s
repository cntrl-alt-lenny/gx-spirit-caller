; func_ov002_022a61e8 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern func_ov002_0229d950
        .global func_ov002_022a61e8
        .arm
func_ov002_022a61e8:
    stmdb sp!, {r3, lr}
    sub ip, r2, #0xb
    cmp ip, #0x4
    addls pc, pc, ip, lsl #0x2
    b .L_9a0
    b .L_988
    b .L_960
    b .L_960
    b .L_960
    b .L_960
.L_960:
    cmp r2, #0xc
    movlt r0, #0x0
    ldmltia sp!, {r3, pc}
    add r3, r0, #0x280
    mov r0, #0xb0
    mla r3, r1, r0, r3
    sub r1, r2, #0xc
    mov r0, #0x2c
    mla r0, r1, r0, r3
    ldmia sp!, {r3, pc}
.L_988:
    add r2, r0, #0x3e0
    mov r0, #0xcc
    mla r0, r1, r0, r2
    mov r1, r3
    bl func_ov002_0229d950
    ldmia sp!, {r3, pc}
.L_9a0:
    add r3, r2, r3
    cmp r3, #0xa
    bhi .L_9c0
    mov r2, #0xdc
    mla r2, r1, r2, r0
    mov r0, #0x14
    mla r0, r3, r0, r2
    ldmia sp!, {r3, pc}
.L_9c0:
    cmp r2, #0x4
    movhi r0, #0x0
    ldmhiia sp!, {r3, pc}
    add r3, r0, #0x1b8
    mov r0, #0x64
    mla r3, r1, r0, r3
    mov r0, #0x14
    mla r0, r2, r0, r3
    ldmia sp!, {r3, pc}
