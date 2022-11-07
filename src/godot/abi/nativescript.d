/*************************************************************************/
/*  godot_nativescript.h                                                 */
/*************************************************************************/
/*                       This file is part of:                           */
/*                           GODOT ENGINE                                */
/*                    http://www.godotengine.org                         */
/*************************************************************************/
/* Copyright (c) 2007-2017 Juan Linietsky, Ariel Manzur.                 */
/* Copyright (c) 2014-2017 Godot Engine contributors (cf. AUTHORS.md)    */
/*                                                                       */
/* Permission is hereby granted, free of charge, to any person obtaining */
/* a copy of this software and associated documentation files (the       */
/* "Software"), to deal in the Software without restriction, including   */
/* without limitation the rights to use, copy, modify, merge, publish,   */
/* distribute, sublicense, and/or sell copies of the Software, and to    */
/* permit persons to whom the Software is furnished to do so, subject to */
/* the following conditions:                                             */
/*                                                                       */
/* The above copyright notice and this permission notice shall be        */
/* included in all copies or substantial portions of the Software.       */
/*                                                                       */
/* THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND,       */
/* EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF    */
/* MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT.*/
/* IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY  */
/* CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT,  */
/* TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE     */
/* SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.                */
/*************************************************************************/
module godot.abi.nativescript;

@nogc nothrow:
extern (C):

import godot.abi.types;

enum godot_nativescript_method_rpc_mode {
    GODOT_METHOD_RPC_MODE_DISABLED,
    GODOT_METHOD_RPC_MODE_ANY_PEER,
    GODOT_METHOD_RPC_MODE_AUTHORITY,
}

struct godot_nativescript_method_attributes {
    godot_nativescript_method_rpc_mode rpc_type;
}

enum godot_nativescript_property_hint {
    GODOT_PROPERTY_HINT_NONE, ///< no hint provided.
    GODOT_PROPERTY_HINT_RANGE, ///< hint_text = "min,max,step,slider; //slider is optional"
    GODOT_PROPERTY_HINT_EXP_RANGE, ///< hint_text = "min,max,step", exponential edit
    GODOT_PROPERTY_HINT_ENUM, ///< hint_text= "val1,val2,val3,etc"
    GODOT_PROPERTY_HINT_EXP_EASING, /// exponential easing funciton (Math::ease)
    GODOT_PROPERTY_HINT_LENGTH, ///< hint_text= "length" (as integer)
    GODOT_PROPERTY_HINT_KEY_ACCEL, ///< hint_text= "length" (as integer)
    GODOT_PROPERTY_HINT_FLAGS, ///< hint_text= "flag1,flag2,etc" (as bit flags)
    GODOT_PROPERTY_HINT_LAYERS_2D_RENDER,
    GODOT_PROPERTY_HINT_LAYERS_2D_PHYSICS,
    GODOT_PROPERTY_HINT_LAYERS_2D_NAVIGATION,
    GODOT_PROPERTY_HINT_LAYERS_3D_RENDER,
    GODOT_PROPERTY_HINT_LAYERS_3D_PHYSICS,
    GODOT_PROPERTY_HINT_LAYERS_3D_NAVIGATION,
    GODOT_PROPERTY_HINT_FILE, ///< a file path must be passed, hint_text (optionally) is a filter "*.png,*.wav,*.doc,"
    GODOT_PROPERTY_HINT_DIR, ///< a directort path must be passed
    GODOT_PROPERTY_HINT_GLOBAL_FILE, ///< a file path must be passed, hint_text (optionally) is a filter "*.png,*.wav,*.doc,"
    GODOT_PROPERTY_HINT_GLOBAL_DIR, ///< a directort path must be passed
    GODOT_PROPERTY_HINT_RESOURCE_TYPE, ///< a resource object type
    GODOT_PROPERTY_HINT_MULTILINE_TEXT, ///< used for string properties that can contain multiple lines
    GODOT_PROPERTY_HINT_PLACEHOLDER_TEXT, ///< used to set a placeholder text for string properties
    GODOT_PROPERTY_HINT_COLOR_NO_ALPHA, ///< used for ignoring alpha component when editing a color
    GODOT_PROPERTY_HINT_IMAGE_COMPRESS_LOSSY,
    GODOT_PROPERTY_HINT_IMAGE_COMPRESS_LOSSLESS,
    GODOT_PROPERTY_HINT_OBJECT_ID,
    GODOT_PROPERTY_HINT_TYPE_STRING, ///< a type string, the hint is the base type to choose
    GODOT_PROPERTY_HINT_NODE_PATH_TO_EDITED_NODE, ///< so something else can provide this (used in scripts)
    GODOT_PROPERTY_HINT_METHOD_OF_VARIANT_TYPE, ///< a method of a type
    GODOT_PROPERTY_HINT_METHOD_OF_BASE_TYPE, ///< a method of a base type
    GODOT_PROPERTY_HINT_METHOD_OF_INSTANCE, ///< a method of an instance
    GODOT_PROPERTY_HINT_METHOD_OF_SCRIPT, ///< a method of a script & base
    GODOT_PROPERTY_HINT_PROPERTY_OF_VARIANT_TYPE, ///< a property of a type
    GODOT_PROPERTY_HINT_PROPERTY_OF_BASE_TYPE, ///< a property of a base type
    GODOT_PROPERTY_HINT_PROPERTY_OF_INSTANCE, ///< a property of an instance
    GODOT_PROPERTY_HINT_PROPERTY_OF_SCRIPT, ///< a property of a script & base
    GODOT_PROPERTY_HINT_MAX,
}

enum godot_nativescript_property_usage_flags {

    GODOT_PROPERTY_USAGE_STORAGE = 1,
    GODOT_PROPERTY_USAGE_EDITOR = 2,
    GODOT_PROPERTY_USAGE_NETWORK = 4,
    GODOT_PROPERTY_USAGE_EDITOR_HELPER = 8,
    GODOT_PROPERTY_USAGE_CHECKABLE = 16, //used for editing global variables
    GODOT_PROPERTY_USAGE_CHECKED = 32, //used for editing global variables
    GODOT_PROPERTY_USAGE_INTERNATIONALIZED = 64, //hint for internationalized strings
    GODOT_PROPERTY_USAGE_GROUP = 128, //used for grouping props in the editor
    GODOT_PROPERTY_USAGE_CATEGORY = 256,
    GODOT_PROPERTY_USAGE_SUBGROUP = 512,
    GODOT_PROPERTY_USAGE_NO_INSTANCE_STATE = 2048,
    GODOT_PROPERTY_USAGE_RESTART_IF_CHANGED = 4096,
    GODOT_PROPERTY_USAGE_SCRIPT_VARIABLE = 8192,
    GODOT_PROPERTY_USAGE_STORE_IF_NULL = 16384,
    GODOT_PROPERTY_USAGE_ANIMATE_AS_TRIGGER = 32768,
    GODOT_PROPERTY_USAGE_UPDATE_ALL_IF_MODIFIED = 65536,

    GODOT_PROPERTY_USAGE_DEFAULT = GODOT_PROPERTY_USAGE_STORAGE | GODOT_PROPERTY_USAGE_EDITOR | GODOT_PROPERTY_USAGE_NETWORK,
    GODOT_PROPERTY_USAGE_DEFAULT_INTL = GODOT_PROPERTY_USAGE_STORAGE | GODOT_PROPERTY_USAGE_EDITOR | GODOT_PROPERTY_USAGE_NETWORK | GODOT_PROPERTY_USAGE_INTERNATIONALIZED,
    GODOT_PROPERTY_USAGE_NO_EDITOR = GODOT_PROPERTY_USAGE_STORAGE | GODOT_PROPERTY_USAGE_NETWORK,
}

struct godot_nativescript_property_attributes {
align(1):
    godot_nativescript_method_rpc_mode rset_type;

    godot_int type;
    godot_nativescript_property_hint hint = godot_nativescript_property_hint
        .GODOT_PROPERTY_HINT_NONE;
    godot_string hint_string;
    godot_nativescript_property_usage_flags usage = godot_nativescript_property_usage_flags
        .GODOT_PROPERTY_USAGE_DEFAULT;
    godot_variant default_value;
}

struct godot_nativescript_instance_create_func {
    // instance pointer, method_data - return user data
    void* function(godot_object, void*) create_func;
    void* method_data;
    void function(void*) free_func;
}

struct godot_nativescript_instance_destroy_func {
    // instance pointer, method data, user data
    void function(godot_object, void*, void*) destroy_func;
    void* method_data;
    void function(void*) free_func;
}

struct godot_nativescript_instance_method {
    // instance pointer, method data, user data, num args, args - return result as varaint
    godot_variant function(godot_object, void*, void*, int, godot_variant**) method;
    void* method_data;
    void function(void*) free_func;
}

struct godot_nativescript_property_set_func {
    // instance pointer, method data, user data, value
    void function(godot_object, void*, void*, godot_variant*) set_func;
    void* method_data;
    void function(void*) free_func;
}

struct godot_nativescript_property_get_func {
    // instance pointer, method data, user data, value
    godot_variant function(godot_object, void*, void*) get_func;
    void* method_data;
    void function(void*) free_func;
}

struct godot_nativescript_signal_argument {
align(1):
    godot_string name;
    godot_int type;
    godot_nativescript_property_hint hint;
    godot_string hint_string;
    godot_nativescript_property_usage_flags usage;
    godot_variant default_value;
}

struct godot_nativescript_signal {
    godot_string name;
    int num_args;
    godot_nativescript_signal_argument* args;
    int num_default_args;
    godot_variant* default_args;
}

// NativeScript 1.1

struct godot_nativescript_method_argument {
    godot_string name;
    godot_variant_type type;
    godot_nativescript_property_hint hint;
    godot_string hint_string;
}

struct godot_nativescript_instance_binding_functions {
    void* function(void*, const void*, godot_object) alloc_instance_binding_data;
    void function(void*, void*) free_instance_binding_data;
    void function(void*, godot_object) refcount_incremented_instance_binding;
    bool function(void*, godot_object) refcount_decremented_instance_binding;
    void* data;
    void function(void*) free_func;
}
