/**
 * 
 */
 
import Vue from "https://cdn.jsdelivr.net/npm/vue@2.6.11/dist/vue.esm.browser.js";
import bezierEasing from "https://cdn.skypack.dev/bezier-easing@2.1.0";

const ease = bezierEasing(0.25, 0.1, 0.25, 1.0);
const easeIn = bezierEasing(0.38, 0.01, 0.78, 0.13);
const midSlow = bezierEasing(0, 0.7, 1, 0.3);

const def = {
  height: 7100,
  elements: {
    sl1: {
      top: 500,
      bottom: 1900,
      topStyle: {
        opacity: 0,
        translateY: -60
      },
      bottomStyle: {
        opacity: 0,
        translateY: 60
      }
    },
    scdown: {
      top: 0,
      bottom: 1000,
      topStyle: {
        opacity: 1
      },
      bottomStyle: {
        opacity: 0
      }
    },
    sl2: {
      top: 1900,
      bottom: 3200,
      topStyle: {
        opacity: 0,
        translateY: -60
      },
      bottomStyle: {
        opacity: 0,
        translateY: 60
      }
    },
    sl3: {
      top: 3300,
      bottom: 4600,
      topStyle: {
        opacity: 0
      },
      bottomStyle: {
        opacity: 0
      }
    },
    wave: {
      top: 4500,
      bottom: 5900,
      topStyle: {
        opacity: 0,
        translateY: 300
      },
      bottomStyle: {
        opacity: 0,
        translateY: 0
      }
    },
    sl4: {
      top: 4700,
      bottom: 6000,
      topStyle: {
        opacity: 0
      },
      bottomStyle: {
        opacity: 0
      }
    },
    sl5: {
      top: 6100,
      bottom: 9000,
      topStyle: {
        opacity: 0
      },
      bottomStyle: {
        opacity: 0
      }
    }
  },
  animations: {
    sl1: [
      {
        top: 500,
        bottom: 1900,
        easing: midSlow,
        styles: {
          translateY: {
            topValue: 60,
            bottomValue: -60
          }
        }
      },
      {
        top: 500,
        bottom: 800,
        easing: ease,
        styles: {
          opacity: {
            topValue: 0,
            bottomValue: 1
          }
        }
      },
      {
        top: 1400,
        bottom: 1900,
        easing: easeIn,
        styles: {
          opacity: {
            topValue: 1,
            bottomValue: 0
          }
        }
      }
    ],
    scdown: [
      {
        top: 600,
        bottom: 1000,
        easing: easeIn,
        styles: {
          opacity: {
            topValue: 1,
            bottomValue: 0
          }
        }
      }
    ],
    sl2: [
      {
        top: 1900,
        bottom: 3200,
        easing: midSlow,
        styles: {
          translateY: {
            topValue: 60,
            bottomValue: -60
          }
        }
      },
      {
        top: 1900,
        bottom: 2500,
        easing: ease,
        styles: {
          opacity: {
            topValue: 0,
            bottomValue: 1
          }
        }
      },
      {
        top: 2600,
        bottom: 3200,
        easing: easeIn,
        styles: {
          opacity: {
            topValue: 1,
            bottomValue: 0
          }
        }
      }
    ],
    sl3: [
      {
        top: 3300,
        bottom: 4600,
        easing: midSlow,
        styles: {
          translateY: {
            topValue: 60,
            bottomValue: -60
          }
        }
      },
      {
        top: 3300,
        bottom: 3900,
        easing: ease,
        styles: {
          opacity: {
            topValue: 0,
            bottomValue: 1
          }
        }
      },
      {
        top: 4000,
        bottom: 4600,
        easing: easeIn,
        styles: {
          opacity: {
            topValue: 1,
            bottomValue: 0
          }
        }
      }
    ],
    wave: [
      {
        top: 4500,
        bottom: 5300,
        easing: ease,
        styles: {
          translateY: {
            topValue: 200,
            bottomValue: 0
          },
          opacity: {
            topValue: 0,
            bottomValue: 1
          }
        }
      },
      {
        top: 5300,
        bottom: 5900,
        easing: easeIn,
        styles: {
          opacity: {
            topValue: 1,
            bottomValue: 0
          }
        }
      }
    ],
    sl4: [
      {
        top: 4700,
        bottom: 6000,
        easing: midSlow,
        styles: {
          translateY: {
            topValue: 60,
            bottomValue: -60
          }
        }
      },
      {
        top: 4700,
        bottom: 5300,
        easing: ease,
        styles: {
          opacity: {
            topValue: 0,
            bottomValue: 1
          }
        }
      },
      {
        top: 5400,
        bottom: 6000,
        easing: easeIn,
        styles: {
          opacity: {
            topValue: 1,
            bottomValue: 0
          }
        }
      }
    ],
    sl5: [
      {
        top: 6100,
        bottom: 7100,
        easing: midSlow,
        styles: {
          translateY: {
            topValue: 60,
            bottomValue: -60
          }
        }
      },
      {
        top: 6100,
        bottom: 6700,
        easing: ease,
        styles: {
          opacity: {
            topValue: 0,
            bottomValue: 1
          }
        }
      }
    ]
  }
};

let enabled = new Map();
let disabled = new Map();

const isAmong = (num, top, bottom) => num >= top && num <= bottom;

const applyStyle = (element, styleName, value, unit = "px") => {
  if (styleName === "translateY") {
    // eslint-disable-next-line no-param-reassign
    element.style.transform = `translateY(${value}${unit})`;
    return;
  }
  if (styleName === "translateX") {
    // eslint-disable-next-line no-param-reassign
    element.style.transform = `translateX(${value}${unit})`;
    return;
  }
  // eslint-disable-next-line no-param-reassign
  element.style[styleName] = value;
};

const component = new Vue({
  el: "#app",
  data() {
    return {
      message: "Welcome to Vue!"
    };
  },
  mounted() {
    this.init();
    window.addEventListener("scroll", this.onScroll);
  },
  beforeDestroy() {
    window.removeEventListener("scroll", this.onScroll);
  },

  methods: {
    init() {
      this.initAnimation();
    },
    // ??????????????? ?????????
    initAnimation() {
      // Sticky Conainer ??? ????????? ?????????.
      this.$refs["sticky-container"].style.height = `${def.height}px`;
      
      // disabled, enabled ??? ??????.
      disabled.clear();
      enabled.clear();
      
      // ?????? ????????? disabled ??? ??????.
      for (const refname of Object.keys(def.elements)) {
        disabled.set(refname, def.elements[refname]);
      }

      // ??? ?????????????????? enabled == false ??? ??????.
      for (const refname of Object.keys(def.animations)) {
        for (const animation of def.animations[refname]) {
          animation.enabled = false;
        }
      }

      // ?????? ????????? ??????
      disabled.forEach((obj, refname) => {
        Object.keys(obj.topStyle).forEach((styleName) => {
          const pushValue = obj.topStyle[styleName];
          this.$refs[refname].style[styleName] = pushValue;
        });
      });
      
      // ?????? ????????? ?????? ??? ?????????????????? ????????? ?????? ????????? ??????????????? ??????
      // ????????? ????????? ????????? ???????????? ??? ??? ????????????.
      this.onScroll();
    },
    applyStyles(currentPos, refname, styles, r, unit = "px") {
      for (const style of Object.keys(styles)) {
        const { topValue, bottomValue } = styles[style];
        const calc = (bottomValue - topValue) * r + topValue;
        applyStyle(this.$refs[refname], style, calc, unit);
      }
    },
    applyAllAnimation(currentPos, refname) {
      const animations = def.animations[refname];
      if (!animations) return;
      for (const animation of animations) {
        const { top: a_top, bottom: a_bottom, easing, styles } = animation;
        const isIn = isAmong(currentPos, a_top, a_bottom);
        // ?????? ?????????????????? ????????? ????????? ??? ?????? ????????? enabled ??????
        if (isIn) {
          if (!animation.enabled) animation.enabled = true;
        } else if (!isIn && animation.enabled) {
          if (currentPos <= a_top) {
            this.applyStyles(currentPos, refname, styles, 0);
          } else if (currentPos >= a_bottom) {
            this.applyStyles(currentPos, refname, styles, 1);
          }
          // eslint-disable-next-line no-param-reassign
          animation.enabled = false;
        }

        // ?????????????????? enabled ??????, ??????????????? ??????.
        if (animation.enabled) {
          const r = easing((currentPos - a_top) / (a_bottom - a_top));
          // eslint-disable-next-line no-param-reassign
          this.applyStyles(currentPos, refname, styles, r);
        }
      }
    },
    onScroll() {
      // ?????? ????????? ?????? ??????
      const scrollTop = window.scrollY || window.pageYOffset;
      const currentPos = scrollTop + window.innerHeight / 2;

      // disabled ???????????? ???????????? ?????? ??????.
      disabled.forEach((obj, refname) => {
        // ?????? ?????? ????????? ?????? ?????? ?????????
        if (
          isAmong(currentPos, obj.top, obj.bottom)
        ) {
          enabled.set(refname, obj);
          this.$refs[refname].classList.remove("disabled");
          this.$refs[refname].classList.add("enabled");
          disabled.delete(refname);
        }
      });

      // enabled ??????????????? ????????? ????????? ??????
      enabled.forEach((obj, refname) => {
        const { top, bottom, topStyle, bottomStyle } = obj;
        // console.log(`${top}, ${bottom}, ${topStyle}, ${bottomStyle}`);
        // ?????? ?????? ?????????
        if (!isAmong(currentPos, top, bottom)) {
          // ?????? ???????????? ???????????? ????????? ??????
          if (currentPos <= top) {
            Object.keys(topStyle).forEach((styleName) => {
              applyStyle(this.$refs[refname], styleName, topStyle[styleName]);
            });
          }
          // ????????? ???????????? ????????? ???????????????
          else if (currentPos >= bottom) {
            Object.keys(bottomStyle).forEach((styleName) => {
              applyStyle(
                this.$refs[refname],
                styleName,
                bottomStyle[styleName]
              );
              // this.$refs[refname].style[styleName] = bottomStyle[styleName];
            });
          }

          // ??????????????? ???????????? disabled??? ??????.
          disabled.set(refname, obj);
          this.$refs[refname].classList.remove("enabled");
          this.$refs[refname].classList.add("disabled");
          enabled.delete(refname);
        }
        
        // enable ?????????, ?????? ????????? ????????? ????????? ??? ??????????????? ???????????????.
        else {
          this.applyAllAnimation(currentPos, refname);
        }
      });
    }
  }
});