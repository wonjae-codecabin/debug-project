import { ApiRepository } from "@/repository/ApiRepository.js";
const apiRepository = new ApiRepository();

export const ResourceModule = {
  namespaced: true,
  state: {
    properties: [],
    activeObject: {}
  },
  actions: {
   
    async fetch({commit}, params) {
      try {
        let res = await apiRepository.fetch({
          type: params.type,
          api_token: `${process.env.VUE_APP_API_TOKEN}`
        });

        return res
        // commit('set', {
        //   properties: res.data.data
        // })

      } catch (e) {
        console.log(e)
      }
    },

    async show({commit}, params) {
      try {
        let res = await apiRepository.show({
          type: params.type,
          id: params.id,
          api_token: `${process.env.VUE_APP_API_TOKEN}`
        });
        
        return res
        // commit('set', {
        //   properties: res.data.data
        // })

      } catch (e) {
        console.log(e)
      }
    },

    async create({state}, params){
      let res = await apiRepository.create({
        type: params.type,
        api_token: `${process.env.VUE_APP_API_TOKEN}`
      });

      return res.data.data

    },


    async update({dispatch}, params){
      let res = await apiRepository.update(params);
      

      dispatch('fetch', {
        type: 'property',
        id: params.get('property_id')
      })
      
    },


    async destroy({state, dispatch}, params){
        
      let res = await apiRepository.delete({
          type: params.type,
          id: state.activeObject.access_token,
          api_token: `${process.env.VUE_APP_API_TOKEN}`
      });
            
      return res
    },

  },

  mutations: {
    set(state, payload) {
      payload['properties'] != undefined ? state.properties = payload['properties'] : null
      payload['activeObject'] != undefined ? state.activeObject = payload['activeObject'] : null
    },
  
  },
}
