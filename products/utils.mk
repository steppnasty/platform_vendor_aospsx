# vars for use by utils
empty :=
space := $(empty) $(empty)
colon := $(empty):$(empty)
underscore := $(empty)_$(empty)

# $(call match-word,w1,w2)
# checks if w1 == w2
# How it works
#   if (w1-w2 not empty or w2-w1 not empty) then not_match else match
#
# returns true or empty
#$(warning :$(1): :$(2): :$(subst $(1),,$(2)):) \
#$(warning :$(2): :$(1): :$(subst $(2),,$(1)):) \
#

# $(call is-platform-sdk-version-at-least,version)
# version is a numeric SDK_VERSION defined above
define is-platform-sdk-version-at-least
$(strip \
  $(if $(filter 1,$(shell echo "$$(( $(PLATFORM_SDK_VERSION) >= $(1) ))" )), \
    true, \
  ) \
)
endef
