; func_0200bd74 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern func_020b377c
        .global func_0200bd74
        .arm
func_0200bd74:
    stmdb sp!, {r3, r4, r5, r6, r7, lr}
    ldr r5, [r0, #0x80]
    mov r0, #0x38
    ldr r4, [r5, #0x14]
    mov r7, r2
    mla r4, r1, r0, r4
    ldrh r0, [r4, #0x2]
    ldrh r1, [r4, #0x4]
    mov r6, r3
    mul r0, r7, r0
    bl func_020b377c
    ldrh r0, [r4, #0x6]
    ldr r2, [r5, #0x4]
    add r0, r0, r1
    ldr r0, [r2, r0, lsl #0x2]
    str r0, [r6, #0x48]
    ldrh r0, [r4, #0x8]
    ldrh r1, [r4, #0xa]
    mul r0, r7, r0
    bl func_020b377c
    ldrh r0, [r4, #0xc]
    ldr r2, [r5, #0x4]
    add r0, r0, r1
    ldr r0, [r2, r0, lsl #0x2]
    str r0, [r6, #0x4c]
    ldrh r0, [r4, #0xe]
    ldrh r1, [r4, #0x10]
    mul r0, r7, r0
    bl func_020b377c
    ldrh r0, [r4, #0x12]
    ldr r2, [r5, #0x4]
    add r0, r0, r1
    ldr r0, [r2, r0, lsl #0x2]
    str r0, [r6, #0x50]
    ldrh r0, [r4, #0x14]
    ldrh r1, [r4, #0x16]
    mul r0, r7, r0
    bl func_020b377c
    ldr r2, [r5, #0x8]
    ldrh r0, [r4, #0x18]
    add r0, r0, r1
    ldr r0, [r2, r0, lsl #0x2]
    strh r0, [r6, #0x54]
    ldrh r0, [r4, #0x1a]
    ldrh r1, [r4, #0x1c]
    mul r0, r7, r0
    bl func_020b377c
    ldr r2, [r5, #0x8]
    ldrh r0, [r4, #0x1e]
    add r0, r0, r1
    ldr r0, [r2, r0, lsl #0x2]
    strh r0, [r6, #0x56]
    ldrh r0, [r4, #0x20]
    ldrh r1, [r4, #0x22]
    mul r0, r7, r0
    bl func_020b377c
    ldr r2, [r5, #0x8]
    ldrh r0, [r4, #0x24]
    add r0, r0, r1
    ldr r0, [r2, r0, lsl #0x2]
    strh r0, [r6, #0x58]
    ldrh r0, [r4, #0x26]
    ldrh r1, [r4, #0x28]
    mul r0, r7, r0
    bl func_020b377c
    ldrh r0, [r4, #0x2a]
    ldr r2, [r5, #0xc]
    add r0, r0, r1
    ldr r0, [r2, r0, lsl #0x2]
    str r0, [r6, #0x5c]
    ldrh r0, [r4, #0x2c]
    ldrh r1, [r4, #0x2e]
    mul r0, r7, r0
    bl func_020b377c
    ldrh r0, [r4, #0x30]
    ldr r2, [r5, #0xc]
    add r0, r0, r1
    ldr r0, [r2, r0, lsl #0x2]
    str r0, [r6, #0x60]
    ldrh r0, [r4, #0x32]
    ldrh r1, [r4, #0x34]
    mul r0, r7, r0
    bl func_020b377c
    ldrh r0, [r4, #0x36]
    ldr r2, [r5, #0xc]
    add r0, r0, r1
    ldr r0, [r2, r0, lsl #0x2]
    str r0, [r6, #0x64]
    ldmia sp!, {r3, r4, r5, r6, r7, pc}
