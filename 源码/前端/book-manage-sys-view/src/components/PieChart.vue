<template>
  <div class="line-main" :style="{ backgroundColor: bag }">
    <div>
      <span class="tag" :style="{ color: fontColor }">
        {{ tag }}</span>
    </div>
    <div ref="chart" :style="{ width: width, height: height }"></div>
  </div>
</template>
<script>
import * as echarts from 'echarts'
export default {
  name: 'PieChart',
  props: {
    types: {
      type: Array,
      default: []
    },
    values: {
      type: Array,
      default: []
    },
    width: {
      type: String,
      default: '100%'
    },
    tag: {
      type: String,
      default: '饼状图'
    },
    height: {
      type: String,
      default: '243px'
    },
    bag: {
      type: String,
      default: '#fff'
    },
    fontColor:{
      type: String,
      default: '#333'
    },
  },
  data() {
    return {
      chart: null,
    }
  },
  watch: {
    types(v1, v2) {
      this.initChart();
    }
  },
  mounted() {
    this.initChart();
  },
  methods: {
    initChart() {
      this.chart = echarts.init(this.$refs.chart)
      let option = {
        title: {
          text: '',
          subtext: '',
          left: 'center'
        },
        tooltip: {
          trigger: 'item'
        },
        legend: {
          orient: 'vertical',
          left: 'left',
          show: false,
        },
        series: [
          {
            name: '',
            type: 'pie',
            radius: '70%',
            avoidLabelOverlap: false,
            label: {
              show: false,
              position: 'center'
            },
            emphasis: {
              label: {
                show: false,
                fontSize: '24',
                fontWeight: '600'
              }
            },
            labelLine: {
              show: true
            },
            label: {
              show: true,
              position: 'outer',
              formatter: '{d}%'
            },
            data: this.values.map((value, index) => ({
              name: this.types[index],
              value: value,
            })),
            itemStyle: {
              color: function (params) {
                const colorList = [
                 '#4E79A7', // 深蓝色，适合作为主色调
                 '#F28E2B', // 橙色，与蓝色形成对比
                 '#E15457', // 红色，用于强调
                 '#76B7B2', // 浅蓝色，与深蓝色形成对比
                 '#59A14F', // 绿色，给人以积极的感觉
                 '#EDC948', // 金色，用于突出显示
                 '#B07AA1', // 紫色，增加多样性
                 '#FF9DA7', // 粉红色，柔和且易于区分
                 '#9C755F', // 棕色，增加温暖感
                ];
                return colorList[params.dataIndex % colorList.length];
              }
            }
          }
        ]
      }
      this.chart.setOption(option)
    }
  },
  beforeDestroy() {
    if (this.chart) {
      this.chart.dispose()
    }
  }
}  
</script>

<style scoped lang="scss">
.line-main {
  padding-top: 10px;
  margin-bottom: 5px;
  border-radius: 3px;
  background-color: #000000;

  .tag {
    font-size: 14px;
    text-align: center;
    padding: 15px 6px;
    display: block;
  }

}
</style>