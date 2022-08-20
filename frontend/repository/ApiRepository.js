import axios from "axios";
import {store} from "@/store/index.js"
export class ApiRepository {
  async fetch(args) {
    let config = {
      params: args
    };

    switch (args.type) {
      default:
        return axios
          .get(`${process.env.VUE_APP_API_URL}/api`, config)
    }
  }

  
  async show(args) {
    let config = {
      params: args
    };

    switch (args.type) {
      default:
        return axios
          .get(`${process.env.VUE_APP_API_URL}/api/${args.id}`, config)
    }
  }


  async create(args) {

    switch (args.type) {
      default:
        return axios
          .post(
            `${process.env.VUE_APP_API_URL}/api`,
            args
          )

    }
  }

  async delete(args) {
    let config = {
        params: args
      };
    switch (args.type) {
    default:
          return axios
            .delete(
                `${process.env.VUE_APP_API_URL}/api/v3/server/${args.id}`,
                config
            )      
    }
  }


  async update(args) {
    let id = args.get('id')
    console.log(args.get('corrective_action_img_file'))
    switch (args.type) {

      default:
        return axios
          .put(
            `${process.env.VUE_APP_API_URL}/api/${id}`,
            args
          )

    }

  }
}
